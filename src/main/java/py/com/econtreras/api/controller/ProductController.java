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
import py.com.econtreras.api.beans.Product;
import py.com.econtreras.api.service.ProductService;

@RestController
@RequestMapping("/products")
public class ProductController {
    
    @Autowired
    private ProductService service;

    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<Product> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Product findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping("/{id}")
    public Product put(@PathVariable Integer id, @Valid @RequestBody Product product) {
        return service.update(id, product);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public Product save(@Valid @RequestBody Product product) {
        return service.save(product);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}
