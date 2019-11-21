package py.com.econtreras.api.controller;


import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import py.com.econtreras.api.beans.SaleInvoiceRequest;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.service.InvoiceService;


@RestController
@RequestMapping("/invoice")
public class InvoiceController {

    private static final Log LOGGER = LogFactory.getLog(InvoiceController.class);
    public static final String INTERNAL_SERVER_ERROR_MESSAGE_VALUE = "Ocurrió un error en el servidor";

    @Autowired
    private InvoiceService invoiceService;

    @PostMapping(value = "/{solicitude_id}")
    public ResponseEntity<?> saveInvoice(@PathVariable("solicitude_id") Integer solicitudeId, @RequestParam(value = "user_id", required = true) Integer userId){
        return  invoiceService.saveInvoice(solicitudeId, userId);
    }

    @GetMapping(value = "/{invoice_id}")
    public ResponseEntity<?> getById(@PathVariable("invoice_id") String invoiceId){
        try {
            SaleInvoiceRequest response = invoiceService.getInvoiceById(Integer.parseInt(invoiceId));
            if(response != null){
                return new ResponseEntity<>(response, HttpStatus.OK);
            }else{
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
        } catch (Exception e){
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, INTERNAL_SERVER_ERROR_MESSAGE_VALUE);
        }


    }

}
