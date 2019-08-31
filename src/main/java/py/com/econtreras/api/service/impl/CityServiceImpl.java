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
import py.com.econtreras.api.beans.CityRequest;
import py.com.econtreras.api.beans.CityResponse;
import py.com.econtreras.api.converter.CityConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.CityRepository;
import py.com.econtreras.api.service.CityService;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityRepository repository;
    @Autowired
    private CityConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(CityServiceImpl.class);

    @Override
    public CityResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.City> optional = repository.findById(id);
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
    public List<CityResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.City> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<CityResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.City entity : entityList) {
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
    public CityResponse save(CityRequest city) {
        try {
            return this.getBean(repository.save(converter.buildEntity(city)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public CityResponse update(Integer id, CityRequest city) {
        try {
            Optional<py.com.econtreras.api.entity.City> optionalEntity = repository.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(city)));
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
        Optional<py.com.econtreras.api.entity.City> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.City city = optionalEntity.get();
            repository.delete(city);
            return true;
        }
    }

    private CityResponse getBean(py.com.econtreras.api.entity.City city){
        links = cargarEnlaces(city);
        if (links == null || links.length == 0){
            return converter.buildBean(city);
        }else{
            return converter.buildBean(city, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.City city){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/cities/" + city.getId()).withSelfRel());
        if (city.getDepartament() != null) {
            link = new Link("http://localhost:8080/departments/" + city.getDepartament().getId()).withRel("department");
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

