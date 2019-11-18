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
import py.com.econtreras.api.beans.RoleRequest;
import py.com.econtreras.api.beans.RoleResponse;
import py.com.econtreras.api.service.RoleService;

@RestController
@RequestMapping("/roles")
public class RoleController {

    @Autowired
    private RoleService service;

    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<RoleResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public RoleResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public RoleResponse put(@Valid @RequestBody RoleRequest role) {
        return service.update(role);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public RoleResponse save(@Valid @RequestBody RoleRequest role) {
        return service.save(role);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}
