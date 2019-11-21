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
import py.com.econtreras.api.beans.CreditNote;

import py.com.econtreras.api.service.CreditNoteService;

@RestController
@RequestMapping("/credit_note")
public class CreditNoteController {

    @Autowired
    private CreditNoteService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public CreditNote findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<CreditNote> findAll() {
        return service.findAll();
    }

    @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public CreditNote put(@Valid @RequestBody CreditNote creditNote) {
        return service.update(creditNote);
    }

    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public CreditNote save(@Valid @RequestBody CreditNote creditNote) {
        return service.save(creditNote);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
