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
import py.com.econtreras.api.beans.FeeRequest;
import py.com.econtreras.api.beans.FeeResponse;
import py.com.econtreras.api.service.FeeService;


@RestController
@RequestMapping("/fees")
public class FeeController {

    @Autowired
    private FeeService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<FeeResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public FeeResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public FeeResponse put(@Valid @RequestBody FeeRequest fee) {
        return service.update(fee);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public FeeResponse save(@Valid @RequestBody FeeRequest fee) {
        return service.save(fee);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
