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
import py.com.econtreras.api.beans.PersonRequest;
import py.com.econtreras.api.beans.PersonResponse;
import py.com.econtreras.api.converter.PersonConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.PersonRepository;
import py.com.econtreras.api.service.PersonService;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonRepository repository;
    @Autowired
    private PersonConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(PersonServiceImpl.class);

    @Override
    public PersonResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Person> optional = repository.findById(id);
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
    public List<PersonResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Person> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<PersonResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Person entity : entityList) {
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
    public PersonResponse save(PersonRequest person) {
        try {
            return this.getBean(repository.save(converter.buildEntity(person)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public PersonResponse update(PersonRequest person) {
        try {
            Optional<py.com.econtreras.api.entity.Person> optionalEntity = repository.findById(person.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(person)));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Boolean delete(Integer id) {
        Optional<py.com.econtreras.api.entity.Person> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Person person = optionalEntity.get();
            repository.delete(person);
            return true;
        }
    }

    private PersonResponse getBean(py.com.econtreras.api.entity.Person person){
        links = cargarEnlaces(person);
        if (links == null || links.length == 0){
            return converter.buildBean(person);
        }else{
            return converter.buildBean(person, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.Person person){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/persons/" + person.getId()).withSelfRel());
        if (person.getDocumentType() != null) {
            link = new Link("http://localhost:8080/document_types/" + person.getDocumentType().getId()).withRel("document_type");
            l.add(link);
        }
        if (person.getPersonType() != null) {
            link = new Link("http://localhost:8080/person_types/" + person.getPersonType().getId()).withRel("person_type");
            l.add(link);
        }
        
        Link[] linkArray = new Link[l.size()];
        for (int i = 0; i < l.size(); i++) {
            Link lo = l.get(i);
            linkArray[i] = lo;
        }
        return linkArray;
    }
}
