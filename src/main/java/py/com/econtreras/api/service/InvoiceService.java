package py.com.econtreras.api.service;

import org.springframework.http.ResponseEntity;

public interface InvoiceService {
    ResponseEntity saveInvoice(Integer id);
}
