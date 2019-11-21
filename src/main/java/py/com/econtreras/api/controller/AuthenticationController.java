package py.com.econtreras.api.controller;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.RegisterRequest;
import py.com.econtreras.api.beans.UserBean;
import py.com.econtreras.api.service.AuthenticationService;

@CrossOrigin("*")
@RestController
@RequestMapping("/authentication")
public class AuthenticationController {
    
    @Autowired
    private AuthenticationService authenticationService;
    
    @PostMapping(value="/login", consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<UserBean> login(@RequestBody UserBean loginBean){
        try {
            UserBean user = authenticationService.login(loginBean);
            return new ResponseEntity(user, HttpStatus.OK);
        } catch (Exception ex) {
            Logger.getLogger(AuthenticationController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.NOT_FOUND);
        }
    }
    
    @PostMapping(value="/register", consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<UserBean> register(@RequestBody RegisterRequest register){
        try {
            UserBean user = authenticationService.register(register);            
            if(user == null){
                return new ResponseEntity(HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity(user, HttpStatus.CREATED);
        } catch (Exception ex) {
            Logger.getLogger(AuthenticationController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }    
    
}
