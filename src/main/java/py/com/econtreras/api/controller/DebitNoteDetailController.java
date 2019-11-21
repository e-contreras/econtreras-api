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

import py.com.econtreras.api.beans.DebitNoteDetail;
import py.com.econtreras.api.service.NoteDebitDetailService;

@RestController
@RequestMapping("/debit_note_detail")
public class DebitNoteDetailController {

    @Autowired
    private NoteDebitDetailService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public DebitNoteDetail findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<DebitNoteDetail> findAll() {
        return service.findAll();
    }

    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public DebitNoteDetail put(@Valid @RequestBody DebitNoteDetail debitNoteDetail) {
        return service.update(debitNoteDetail);
    }
    
    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public DebitNoteDetail save(@Valid @RequestBody DebitNoteDetail debitNoteDetail) {
        return service.save(debitNoteDetail);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
