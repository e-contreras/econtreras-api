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
import py.com.econtreras.api.beans.FeeRequest;
import py.com.econtreras.api.beans.FeeResponse;
import py.com.econtreras.api.converter.FeeConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.FeeRepository;
import py.com.econtreras.api.service.FeeService;

@Service
public class FeeServiceImpl implements FeeService {

    @Autowired
    private FeeRepository repository;
    @Autowired
    private FeeConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(FeeServiceImpl.class);

    @Override
    public FeeResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Fee> optional = repository.findById(id);
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
    public List<FeeResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Fee> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<FeeResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Fee entity : entityList) {
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
    public FeeResponse save(FeeRequest fee) {
        try {
            return this.getBean(repository.save(converter.buildEntity(fee)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public FeeResponse update(FeeRequest fee) {
        try {
            Optional<py.com.econtreras.api.entity.Fee> optionalEntity = repository.findById(fee.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(fee)));
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
        Optional<py.com.econtreras.api.entity.Fee> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Fee fee = optionalEntity.get();
            repository.delete(fee);
            return true;
        }
    }

    private FeeResponse getBean(py.com.econtreras.api.entity.Fee fee){
        links = cargarEnlaces(fee);
        if (links == null || links.length == 0){
            return converter.buildBean(fee);
        }else{
            return converter.buildBean(fee, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.Fee fee){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/fees/" + fee.getId()).withSelfRel());
        if (fee.getCategory() != null) {
            link = new Link("http://localhost:8080/categories/" + fee.getCategory().getId()).withRel("category");
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

