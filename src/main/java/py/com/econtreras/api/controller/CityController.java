package py.com.econtreras.api.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import py.com.econtreras.api.beans.CityRequest;
import py.com.econtreras.api.beans.CityResponse;
import py.com.econtreras.api.service.CityService;

@CrossOrigin("*")
@RestController
@RequestMapping("/cities")
public class CityController {

    @Autowired
    private CityService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<CityResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public CityResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public CityResponse put(@Valid @RequestBody CityRequest city) {
        return service.update(city);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public CityResponse save(@Valid @RequestBody CityRequest city) {
        return service.save(city);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
