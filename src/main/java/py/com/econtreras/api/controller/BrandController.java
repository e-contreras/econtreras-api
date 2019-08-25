package py.com.econtreras.api.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import py.com.econtreras.api.beans.Brand;
import py.com.econtreras.api.service.BrandService;

@RestController
@RequestMapping("/brands")
public class BrandController {
    
    @Autowired
    private BrandService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<Brand> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Brand findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping("/{id}")
    public Brand put(@PathVariable Integer id, @Valid @RequestBody Brand brand) {
        return service.update(id, brand);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public Brand save(@Valid @RequestBody Brand brand) {
        return service.save(brand);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}
