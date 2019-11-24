package py.com.econtreras.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import py.com.econtreras.api.beans.BugetSolicitudeResponse;
import py.com.econtreras.api.service.BugetSolicitudeService;

import javax.validation.Valid;
import javax.xml.ws.Response;
import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/buget/solicitude")
public class BugetSolicitudeController {

    @Autowired
    private BugetSolicitudeService bugetSolicitudeService;

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<BugetSolicitudeResponse>> getAll(){
        List<BugetSolicitudeResponse> list = bugetSolicitudeService.findAll();
        if(list == null || list.isEmpty()){
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }else{
            return new ResponseEntity<List<BugetSolicitudeResponse>>(list, HttpStatus.OK);
        }
    }

    @GetMapping(value = "/{buget_solicitude_id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BugetSolicitudeResponse> getAll(@PathVariable(value = "buget_solicitude_id", required = true) Integer bugetSolicitudeId){
        BugetSolicitudeResponse response = bugetSolicitudeService.findById(bugetSolicitudeId);
        if(response == null){
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> save(@Valid @RequestBody BugetSolicitudeResponse bugetSolicitudeResponse){
        BugetSolicitudeResponse response = bugetSolicitudeService.save(bugetSolicitudeResponse);
        if(response != null){
            return new ResponseEntity<>(response, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.UNPROCESSABLE_ENTITY);
    }
}
