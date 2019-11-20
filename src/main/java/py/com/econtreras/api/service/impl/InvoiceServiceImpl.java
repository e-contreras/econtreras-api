package py.com.econtreras.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.repository.*;
import py.com.econtreras.entity.*;

import java.time.LocalDate;
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

    @Autowired
    private InvoiceRepository invoiceRepository;
    @Autowired
    private RingingRepository ringingRepository;
    @Autowired
    private SolicitudeRepository solicitudeRepository;
    @Autowired
    private ProductSolicitudeRepository productSolicitudeRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ClientRepository clientRepository;
    @Autowired
    private ReceiptNumberRepository receiptNumberRepository;

    @Override
    public void saveInvoice(Integer id) {

        Ringing ringing = ringingRepository.getMax(DOCUMENT_TYPE_INVOICE);
        validRinging(ringing);

        SalesInvoice salesInvoice =  new SalesInvoice();
        salesInvoice.setRinging(ringing);
        Optional<Client> clientOptional = clientRepository.findById(1);
        salesInvoice.setClient(clientOptional.get());
        salesInvoice.setEmissionDate(new Date());
        ReceiptNumberPK rPk = new ReceiptNumberPK(BRANCH_NUMBER, SALE_POINT_NUMBER);
        Optional<ReceiptNumber> receiptNumberOptional = receiptNumberRepository.findById(rPk);
        ReceiptNumber receiptNumber =receiptNumberOptional.get();
        receiptNumber.setSequence(receiptNumber.getSequence() + 1);
        receiptNumber = receiptNumberRepository.save(receiptNumber);
        String invoiceReceipNumber = getInvoiceReciptNumber(receiptNumber);
        salesInvoice.setInvoiceNumber(invoiceReceipNumber);
        salesInvoice = invoiceRepository.save(salesInvoice);

        Optional<Solicitude> solicitudeOptional = solicitudeRepository.findById(id);
        Solicitude solicitude = solicitudeOptional.isPresent() ? solicitudeOptional.get() : null;
        if(solicitude != null){
            List<ProductSolicitude> productSolicitudes = productSolicitudeRepository.findBySolicitude(solicitude);
            List<SalesInvoiceDetail> invoiceDetails = new ArrayList<>();
            for (ProductSolicitude productSolicitude: productSolicitudes) {
                SalesInvoiceDetailPK pk = new SalesInvoiceDetailPK();
                pk.setInvoice(salesInvoice.getId());
                pk.setProductId(productSolicitude.getProduct().getId());
                SalesInvoiceDetail invoiceDetail = new SalesInvoiceDetail(pk);
                invoiceDetail.setPrice(productSolicitude.getPrice().doubleValue());
                invoiceDetail.setQuantity(productSolicitude.getQuantity());
                invoiceDetail.setSolicitude(solicitude);
                invoiceDetails.add(invoiceDetail);
            }

            salesInvoice.setFacVenDetallesList(invoiceDetails);
            invoiceRepository.save(salesInvoice);
        }


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


}
