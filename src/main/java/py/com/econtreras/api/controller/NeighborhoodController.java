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
import py.com.econtreras.api.beans.NeighborhoodRequest;
import py.com.econtreras.api.beans.NeighborhoodResponse;
import py.com.econtreras.api.service.NeighborhoodService;


@RestController
@RequestMapping("/neighborhoods")
public class NeighborhoodController {

    @Autowired
    private NeighborhoodService service;
    
    @GetMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public List<NeighborhoodResponse> findAll() {
        return service.findAll();
    }
    
    @GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public NeighborhoodResponse findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public NeighborhoodResponse put(@Valid @RequestBody NeighborhoodRequest neighborhood) {
        return service.update(neighborhood);
    }
    
    @PostMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public NeighborhoodResponse save(@Valid @RequestBody NeighborhoodRequest neighborhood) {
        return service.save(neighborhood);
    }
    
    @DeleteMapping(value = "{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}

