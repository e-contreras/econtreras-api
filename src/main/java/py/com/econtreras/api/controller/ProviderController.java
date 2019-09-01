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
import py.com.econtreras.api.beans.ProviderRequest;
import py.com.econtreras.api.beans.ProviderResponse;
import py.com.econtreras.api.service.ProviderService;

@RestController
@RequestMapping("/providers")
public class ProviderController {

    @Autowired
    private ProviderService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<ProviderResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ProviderResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public ProviderResponse put(@Valid @RequestBody ProviderRequest provider) {
        return service.update(provider);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public ProviderResponse save(@Valid @RequestBody ProviderRequest provider) {
        return service.save(provider);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}



