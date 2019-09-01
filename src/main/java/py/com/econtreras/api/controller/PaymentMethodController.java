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
import py.com.econtreras.api.beans.PaymentMethod;
import py.com.econtreras.api.service.PaymentMethodService;

@RestController
@RequestMapping("/payment_methods")
public class PaymentMethodController {

    @Autowired
    private PaymentMethodService service;

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public PaymentMethod findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<PaymentMethod> findAll() {
        return service.findAll();
    }

    
    @PutMapping(produces= MediaType.APPLICATION_JSON_VALUE)
    public PaymentMethod put(@Valid @RequestBody PaymentMethod paymentMethod) {
        return service.update(paymentMethod);
    }
    
    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public PaymentMethod save(@Valid @RequestBody PaymentMethod paymentMethod) {
        return service.save(paymentMethod);
    }

    @DeleteMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Boolean delete(@PathVariable Integer id) {
        return service.delete(id);
    }

}
