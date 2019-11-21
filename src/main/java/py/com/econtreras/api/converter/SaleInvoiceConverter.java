package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.SaleInvoiceDetailRequest;
import py.com.econtreras.api.beans.SaleInvoiceRequest;
import py.com.econtreras.entity.SalesInvoice;
import py.com.econtreras.entity.SalesInvoiceDetail;

import java.util.ArrayList;
import java.util.List;

@Component
public class SaleInvoiceConverter {

    public SalesInvoice buildFromRequest(SaleInvoiceRequest request){
        SalesInvoice entity = new SalesInvoice();
        entity.setInvoiceNumber(request.getInvoiceNumber());
        entity.setEmissionDate(request.getEmissionDate());
        entity.setFacVenDetallesList(this.buildDetailsFromRequest(request.getDetailList()));
        entity.setId(request.getId());
        return entity;
    }

    public SalesInvoiceDetail builDetailFromRequest(SaleInvoiceDetailRequest request){
        SalesInvoiceDetail salesInvoiceDetail = new SalesInvoiceDetail();
        salesInvoiceDetail.setTaxtType(request.getTaxtType());
        salesInvoiceDetail.setQuantity(request.getQuantity());
        salesInvoiceDetail.setPrice(request.getPrice());
        return salesInvoiceDetail;

    }

    private List<SalesInvoiceDetail> buildDetailsFromRequest(List<SaleInvoiceDetailRequest> detailList) {

        List<SalesInvoiceDetail> list = new ArrayList<>();
        detailList.forEach(request -> {
            list.add(builDetailFromRequest(request));
        });
        return list;

    }

    public SaleInvoiceRequest buildFromRequest(SalesInvoice entity){
        SaleInvoiceRequest request = new SaleInvoiceRequest();
        request.setInvoiceNumber(entity.getInvoiceNumber());
        request.setEmissionDate(entity.getEmissionDate());
        request.setDetailList(this.buildDetailsFromEntity(entity.getFacVenDetallesList()));
        request.setId(request.getId());
        return request;
    }

    public SaleInvoiceDetailRequest builDetailFromEntity(SalesInvoiceDetail entity){
        SaleInvoiceDetailRequest request = new SaleInvoiceDetailRequest();
        request.setTaxtType(entity.getTaxtType());
        request.setQuantity(entity.getQuantity());
        request.setPrice(entity.getPrice());
        return request;

    }

    private List<SaleInvoiceDetailRequest> buildDetailsFromEntity(List<SalesInvoiceDetail> detailList) {

        List<SaleInvoiceDetailRequest> list = new ArrayList<>();
        detailList.forEach(entiy -> {
            list.add(builDetailFromEntity(entiy));
        });
        return list;

    }

}
