package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.CustomerRequest;
import py.com.econtreras.api.beans.CustomerResponse;
import py.com.econtreras.api.converter.PersonConverter;
import py.com.econtreras.api.converter.CustomerConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.PersonRepository;
import py.com.econtreras.api.repository.CustomerRepository;
import py.com.econtreras.api.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private PersonRepository personRepository;
    @Autowired
    private CustomerRepository repository;
    @Autowired
    private PersonConverter personConverter;
    @Autowired
    private CustomerConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(CustomerServiceImpl.class);

    @Override
    public CustomerResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Customer> optional = repository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<CustomerResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Customer> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<CustomerResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Customer entity : entityList) {
                beans.add(this.getBean(entity));
            }
            return beans;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public CustomerResponse save(CustomerRequest customer) {
        try {
            customer.setPersonId(personConverter.buildBean(personRepository.save(personConverter.buildEntity(customer))).getPersonId());
            return this.getBean(repository.save(converter.buildEntity(customer)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public CustomerResponse update(CustomerRequest customer) {
        try {
            Optional<py.com.econtreras.api.entity.Customer> optionalEntity = repository.findById(customer.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                customer.setPersonId(personConverter.buildBean(personRepository.save(personConverter.buildEntity(customer))).getPersonId());
                return this.getBean(repository.save(converter.buildEntity(customer)));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public Boolean delete(Integer id) {
        Optional<py.com.econtreras.api.entity.Customer> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Customer customer = optionalEntity.get();
            customer.setErased(new Short("1"));
            personRepository.save(customer.getPerson());
            return true;
        }
    }

    private CustomerResponse getBean(py.com.econtreras.api.entity.Customer customer){
        links = cargarEnlaces(customer);
        if (links == null || links.length == 0){
            return converter.buildBean(customer);
        }else{
            return converter.buildBean(customer, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.Customer customer){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/customers/" + customer.getId()).withSelfRel());
//        if (customer.getPerson() != null) {
//            link = new Link("http://localhost:8080/persons/" + customer.getPerson().getId()).withRel("person");
//            l.add(link);
//        }
        
        Link[] linkArray = new Link[l.size()];
        for (int i = 0; i < l.size(); i++) {
            Link lo = l.get(i);
            linkArray[i] = lo;
        }
        return linkArray;
    }
}

