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
import py.com.econtreras.api.beans.DebitNote;

import py.com.econtreras.api.service.DebitNoteService;

@RestController
@RequestMapping("/debit_note")
public class DebitNoteController {

    @Autowired
    private DebitNoteService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public DebitNote findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<DebitNote> findAll() {
        return service.findAll();
    }

    @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public DebitNote put(@Valid @RequestBody DebitNote debitNote) {
        return service.update(debitNote);
    }

    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public DebitNote save(@Valid @RequestBody DebitNote debitNote) {
        return service.save(debitNote);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
