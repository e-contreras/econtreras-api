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
import py.com.econtreras.api.beans.AddressRequest;
import py.com.econtreras.api.beans.AddressResponse;
import py.com.econtreras.api.converter.AddressConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.AddressRepository;
import py.com.econtreras.api.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressRepository repository;
    @Autowired
    private AddressConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(AddressServiceImpl.class);

    @Override
    public AddressResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Address> optional = repository.findById(id);
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
    public List<AddressResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Address> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<AddressResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Address entity : entityList) {
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
    public AddressResponse save(AddressRequest address) {
        try {
            return this.getBean(repository.save(converter.buildEntity(address)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public AddressResponse update(AddressRequest address) {
        try {
            Optional<py.com.econtreras.api.entity.Address> optionalEntity = repository.findById(address.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(address)));
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
        Optional<py.com.econtreras.api.entity.Address> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Address address = optionalEntity.get();
            repository.delete(address);
            return true;
        }
    }

    private AddressResponse getBean(py.com.econtreras.api.entity.Address address){
        links = cargarEnlaces(address);
        if (links == null || links.length == 0){
            return converter.buildBean(address);
        }else{
            return converter.buildBean(address, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.Address address){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/addresses/" + address.getId()).withSelfRel());
        if (address.getNeighborhood() != null) {
            link = new Link("http://localhost:8080/neighborhoods/" + address.getNeighborhood().getId()).withRel("neighborhood");
            l.add(link);
        }
        if (address.getPerson() != null) {
            link = new Link("http://localhost:8080/persons/" + address.getPerson().getId()).withRel("person");
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

