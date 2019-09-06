package py.com.econtreras.api.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.CustomerRequest;
import py.com.econtreras.api.beans.CustomerResponse;
import py.com.econtreras.api.service.CustomerService;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    @Autowired
    private CustomerService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<CustomerResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public CustomerResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public CustomerResponse put(@Valid @RequestBody CustomerRequest customer) {
        return service.update(customer);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public CustomerResponse save(@Valid @RequestBody CustomerRequest customer) {
        return service.save(customer);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}
