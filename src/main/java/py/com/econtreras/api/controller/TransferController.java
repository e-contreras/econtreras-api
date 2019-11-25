package py.com.econtreras.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.WorkOrderRequest;
import py.com.econtreras.api.service.TransferService;

@CrossOrigin("*")
@RestController
@RequestMapping("/transfer")
public class TransferController {
    
    @Autowired
    private TransferService transferService;
    
    @PostMapping(consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> asignPackage(@RequestBody WorkOrderRequest request){
        try{
            transferService.asignPackage(request);
            return new ResponseEntity(request, HttpStatus.CREATED);
        }
        catch(Exception ex){
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
}
