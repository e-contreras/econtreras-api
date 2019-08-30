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
import py.com.econtreras.api.beans.PersonType;
import py.com.econtreras.api.service.PersonTypeService;

@RestController
@RequestMapping("/personType")
public class PersonTypeController {

    @Autowired
    private PersonTypeService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public PersonType findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<PersonType> findAll() {
        return service.findAll();
    }

    
    @PutMapping("/{id}")
    public PersonType put(@PathVariable Integer id, @Valid @RequestBody PersonType personType) {
        return service.update(id, personType);
    }
    
    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public PersonType save(@Valid @RequestBody PersonType documentType) {
        return service.save(documentType);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
