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
import py.com.econtreras.api.beans.AddressRequest;
import py.com.econtreras.api.beans.AddressResponse;
import py.com.econtreras.api.service.AddressService;

@RestController
@RequestMapping("/addresses")
public class AddressController {

    @Autowired
    private AddressService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<AddressResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public AddressResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public AddressResponse put(@Valid @RequestBody AddressRequest address) {
        return service.update(address);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public AddressResponse save(@Valid @RequestBody AddressRequest address) {
        return service.save(address);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}