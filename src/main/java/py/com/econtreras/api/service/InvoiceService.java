package py.com.econtreras.api.service;

import org.springframework.http.ResponseEntity;
import py.com.econtreras.api.beans.SaleInvoiceRequest;

public interface InvoiceService {
    ResponseEntity saveInvoice(Integer solicitudeId, Integer userId);
    SaleInvoiceRequest getInvoiceById(Integer id);
}
