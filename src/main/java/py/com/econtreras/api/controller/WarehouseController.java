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
import py.com.econtreras.api.beans.Warehouse;
import py.com.econtreras.api.service.WarehouseService;

@RestController
@RequestMapping("/warehouses")
public class WarehouseController {
    
    @Autowired
    private WarehouseService service;

    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<Warehouse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Warehouse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping("/{id}")
    public Warehouse put(@PathVariable Integer id, @Valid @RequestBody Warehouse warehouse) {
        return service.update(id, warehouse);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public Warehouse save(@Valid @RequestBody Warehouse warehouse) {
        return service.save(warehouse);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }
    
}
