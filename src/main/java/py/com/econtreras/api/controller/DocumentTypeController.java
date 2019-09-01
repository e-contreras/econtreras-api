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

import py.com.econtreras.api.beans.DocumentType;
import py.com.econtreras.api.service.DocumentTypeService;

@RestController
@RequestMapping("/document_types")
public class DocumentTypeController {

    @Autowired
    private DocumentTypeService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public DocumentType findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<DocumentType> findAll() {
        return service.findAll();
    }

    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public DocumentType put(@Valid @RequestBody DocumentType documentType) {
        return service.update(documentType);
    }
    
    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public DocumentType save(@Valid @RequestBody DocumentType documentType) {
        return service.save(documentType);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
