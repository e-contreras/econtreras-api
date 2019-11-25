/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.UserBean;
import py.com.econtreras.api.service.DriverService;

@CrossOrigin("*")
@RestController
@RequestMapping("/driver")
public class DriverController {
    
    @Autowired
    private DriverService driverService;
    
    @GetMapping(produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> findAll(){
        try {
            List<UserBean> drivers = driverService.findAll();
            if(drivers == null || drivers.isEmpty()){
                return new ResponseEntity(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity(drivers, HttpStatus.OK);
        } catch (Exception ex) {
            Logger.getLogger(SolicitudeController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }    
    
}
