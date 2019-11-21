package py.com.econtreras.api.service.impl;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.SaleInvoiceDetailRequest;
import py.com.econtreras.api.beans.SaleInvoiceRequest;
import py.com.econtreras.api.converter.SaleInvoiceConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.repository.*;
import py.com.econtreras.entity.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import py.com.econtreras.api.service.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    private static final String DOCUMENT_TYPE_INVOICE = "factura";
    private static final String MESSAGE_INVALID_INVOICE = "El timbrado para la factura es inválido o no existe";
    private static final String BRANCH_NUMBER = "001";
    private static final String SALE_POINT_NUMBER = "001";
    private static final String PAYMENT_STATUS_VALUE = "PAGADO";
    private static final String SUCCESS_PAYMENT_MESSAGE = "Pago realizado exitosamente";
    private static final String ALREADY_PAID_MESSAGE = "Lo solicitud elegida ya se había pagado con anterioridad";
    private static final String REQUEST_NOT_FOUND = "Solicitud no encontrada";
    public static final String WORK_ORDER_CREATE_STATUS_VALUE = "CREADO";

    @Autowired
    private InvoiceRepository invoiceRepository;
    @Autowired
    private RingingRepository ringingRepository;
    @Autowired
    private SolicitudeRepository solicitudeRepository;
    @Autowired
    private ProductSolicitudeRepository productSolicitudeRepository;
    @Autowired
    private ClientRepository clientRepository;
    @Autowired
    private ReceiptNumberRepository receiptNumberRepository;
    @Autowired
    private SolicitudeStatusRepository statusRepository;
    @Autowired
    private WorkOrderRepository workOrderRepository;
    @Autowired
    private WorkOrderStatusRepository workOrderStatusRepository;
    @Autowired
    private SaleInvoiceConverter saleInvoiceConverter;
    @Autowired
    private UserRepository userRepository;


    @Override
    public ResponseEntity saveInvoice(Integer solicitudeId, Integer userId) {

        Ringing ringing = ringingRepository.getMax(DOCUMENT_TYPE_INVOICE);
        validRinging(ringing);
        Optional<Solicitude> solicitudeOptional = solicitudeRepository.findById(solicitudeId);
        Solicitude solicitude = solicitudeOptional.isPresent() ? solicitudeOptional.get() : null;

        if(solicitude == null || solicitude.getId() == null){
            return new ResponseEntity(REQUEST_NOT_FOUND, HttpStatus.UNPROCESSABLE_ENTITY);
        } else if(solicitude.getStatus() != null && solicitude.getStatus().getStatusName() != null && solicitude.getStatus().getStatusName().equalsIgnoreCase(PAYMENT_STATUS_VALUE)){
            return new ResponseEntity(ALREADY_PAID_MESSAGE, HttpStatus.UNPROCESSABLE_ENTITY);
        }


        SalesInvoice salesInvoice =  new SalesInvoice();
        salesInvoice.setRinging(ringing);
        Optional<User> userOptional = userRepository.findById(userId);
        if(!userOptional.isPresent())
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, "Error al intentar guardar con el usuario: "+userId);

        salesInvoice.setClient(userOptional.get());
        salesInvoice.setEmissionDate(LocalDateTime.now());
        ReceiptNumberPK rPk = new ReceiptNumberPK(BRANCH_NUMBER, SALE_POINT_NUMBER);
        Optional<ReceiptNumber> receiptNumberOptional = receiptNumberRepository.findById(rPk);
        ReceiptNumber receiptNumber =receiptNumberOptional.get();
        receiptNumber.setSequence(receiptNumber.getSequence() + 1);
        receiptNumber = receiptNumberRepository.save(receiptNumber);
        String invoiceReceipNumber = getInvoiceReciptNumber(receiptNumber);
        salesInvoice.setInvoiceNumber(invoiceReceipNumber);
        salesInvoice = invoiceRepository.save(salesInvoice);

            List<ProductSolicitude> productSolicitudes = productSolicitudeRepository.findBySolicitude(solicitude);
            List<SalesInvoiceDetail> invoiceDetails = new ArrayList<>();
            for (ProductSolicitude productSolicitude: productSolicitudes) {
                Product p = productSolicitude.getProduct();
                Integer taxtType = p != null && p.getTaxtType() != null ? p.getTaxtType() : 10;
                SalesInvoiceDetailPK pk = new SalesInvoiceDetailPK();
                pk.setInvoice(salesInvoice.getId());
                pk.setProductId(productSolicitude.getProduct().getId());
                SalesInvoiceDetail invoiceDetail = new SalesInvoiceDetail(pk);
                invoiceDetail.setPrice(productSolicitude.getPrice().doubleValue());
                invoiceDetail.setQuantity(productSolicitude.getQuantity());
                invoiceDetail.setSolicitude(solicitude);
                invoiceDetails.add(invoiceDetail);
                invoiceDetail.setTaxtType(taxtType);
            }

            salesInvoice.setFacVenDetallesList(invoiceDetails);
            invoiceRepository.save(salesInvoice);
            Optional<SolicitudeStatus> statusOptional = statusRepository.findSolicitudeStatusBy(PAYMENT_STATUS_VALUE);
            solicitude.setStatus(statusOptional.get());
            solicitudeRepository.save(solicitude);
            this.initWorkOrder(solicitude);

        return new ResponseEntity(SUCCESS_PAYMENT_MESSAGE, HttpStatus.OK);


    }

    private String getInvoiceReciptNumber(ReceiptNumber receiptNumber) {
        String receiptNumberString = receiptNumber.getSequence().toString();
        if(receiptNumberString.length() < 7){
            for (int i = 6; i > 0; i--) {
                receiptNumberString = "0"+receiptNumberString;
            }
        }
        return receiptNumberString;
    }

    private void validRinging(Ringing ringing) {
        if (ringing == null && ringing.getValidityDate().compareTo(LocalDate.now()) < 0)
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, MESSAGE_INVALID_INVOICE);
    }

    private void initWorkOrder(Solicitude solicitude){
        Optional<WorkOrderStatus> optionalWorkOrderStatus =  workOrderStatusRepository.findByDescription(WORK_ORDER_CREATE_STATUS_VALUE);
        WorkOrder workOrder = new WorkOrder();
        workOrder.setCreationDate(new Date());
        workOrder.setSolicitude(solicitude);
        workOrder.setStatus(optionalWorkOrderStatus.get());
        workOrderRepository.save(workOrder);
    }

    @Override
    @Transactional
    public SaleInvoiceRequest getInvoiceById(Integer id){
        Optional<SalesInvoice> salesInvoiceOptional = invoiceRepository.findById(id);
        if(!salesInvoiceOptional.isPresent()){
            return null;
        }

        SalesInvoice salesInvoice = salesInvoiceOptional.get();
        Hibernate.initialize(salesInvoice.getFacVenDetallesList());
        Hibernate.initialize(salesInvoice.getRinging());
        SaleInvoiceRequest request = new SaleInvoiceRequest();
        request.setEmissionDate(salesInvoice.getEmissionDate());
        request.setId(salesInvoice.getId());
        request.setRinging(salesInvoice.getRinging().getRinging());
        request.setValidDate(salesInvoice.getRinging().getValidityDate());
        request.setInvoiceNumber(salesInvoice.getInvoiceNumber());
        List<SaleInvoiceDetailRequest> detailRequests = new ArrayList<>();
        salesInvoice.getFacVenDetallesList().forEach(salesInvoiceDetail -> {
            SaleInvoiceDetailRequest detailRequest = new SaleInvoiceDetailRequest();
            detailRequest.setProductId(salesInvoiceDetail.getProduct().getId());
            detailRequest.setProductName(salesInvoiceDetail.getProduct().getProductName());
            detailRequest.setQuantity(salesInvoiceDetail.getQuantity());
            detailRequest.setPrice(salesInvoiceDetail.getPrice());
            detailRequest.setTaxtType(salesInvoiceDetail.getTaxtType());
            detailRequests.add(detailRequest);
        });
        request.setDetailList(detailRequests);

        return request;

    }


}
