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
import py.com.econtreras.api.beans.CreditNoteDetail;

import py.com.econtreras.api.service.CreditNoteDetailService;

@RestController
@RequestMapping("/credit_note_detail")
public class CreditNoteDetailController {

    @Autowired
    private CreditNoteDetailService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public CreditNoteDetail findById(@PathVariable Integer id) {
        return service.findById(id);
    }
    
    @GetMapping(value = "/credit/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<CreditNoteDetail> findByCreditId(@PathVariable("id") Integer id) {
        return service.findByCreditId(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<CreditNoteDetail> findAll() {
        return service.findAll();
    }

    @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public CreditNoteDetail put(@Valid @RequestBody CreditNoteDetail creditNoteDetail) {
        return service.update(creditNoteDetail);
    }

    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public CreditNoteDetail save(@Valid @RequestBody CreditNoteDetail creditNoteDetail) {
        return service.save(creditNoteDetail);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
