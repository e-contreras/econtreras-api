package py.com.econtreras.api.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.service.InvoiceService;


@RestController
@RequestMapping("/invoice")
public class InvoiceController {

    @Autowired
    private InvoiceService invoiceService;

    @PostMapping(value = "/{solicitude_id}")
    public ResponseEntity<?> saveInvoice(@PathVariable("solicitude_id") Integer solicitudeId){
        return  invoiceService.saveInvoice(solicitudeId);
    }

}
