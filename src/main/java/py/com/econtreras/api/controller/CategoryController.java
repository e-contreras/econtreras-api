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
import py.com.econtreras.api.beans.Category;
import py.com.econtreras.api.service.CategoryService;

@RestController
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<Category> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Category findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping("/{id}")
    public Category put(@PathVariable Integer id, @Valid @RequestBody Category category) {
        return service.update(id, category);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public Category save(@Valid @RequestBody Category category) {
        return service.save(category);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}
