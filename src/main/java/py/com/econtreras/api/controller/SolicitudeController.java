package py.com.econtreras.api.controller;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.SolicitudeResponse;
import py.com.econtreras.api.service.SolicitudeService;

@CrossOrigin("*")
@RestController
@RequestMapping("/solicitude")
public class SolicitudeController {
    
    @Autowired
    private SolicitudeService solicitudeService;
    
    @GetMapping(value="/{clientId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> findByClient(@PathVariable("clientId") Integer clientId){
        try {
            List<SolicitudeResponse> solicitudes = solicitudeService.findByClientId(clientId);
            if(solicitudes == null || solicitudes.isEmpty()){
                return new ResponseEntity(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity(solicitudes, HttpStatus.OK);
        } catch (Exception ex) {
            Logger.getLogger(SolicitudeController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @GetMapping(produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> findAll(){
        try {
            List<SolicitudeResponse> solicitudes = solicitudeService.findAll();
            if(solicitudes == null || solicitudes.isEmpty()){
                return new ResponseEntity(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity(solicitudes, HttpStatus.OK);
        } catch (Exception ex) {
            Logger.getLogger(SolicitudeController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
}
