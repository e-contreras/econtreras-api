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
import py.com.econtreras.api.beans.NeighborhoodRequest;
import py.com.econtreras.api.beans.NeighborhoodResponse;
import py.com.econtreras.api.converter.NeighborhoodConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.NeighborhoodRepository;
import py.com.econtreras.api.service.NeighborhoodService;

@Service
public class NeighborhoodServiceImpl implements NeighborhoodService{

    @Autowired
    private NeighborhoodRepository repository;
    @Autowired
    private NeighborhoodConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(NeighborhoodServiceImpl.class);

    @Override
    public NeighborhoodResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Neighborhood> optional = repository.findById(id);
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
    public List<NeighborhoodResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Neighborhood> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<NeighborhoodResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Neighborhood entity : entityList) {
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
    public NeighborhoodResponse save(NeighborhoodRequest neighborhood) {
        try {
            return this.getBean(repository.save(converter.buildEntity(neighborhood)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public NeighborhoodResponse update(Integer id, NeighborhoodRequest neighborhood) {
        try {
            Optional<py.com.econtreras.api.entity.Neighborhood> optionalEntity = repository.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(neighborhood)));
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
        Optional<py.com.econtreras.api.entity.Neighborhood> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Neighborhood neighborhood = optionalEntity.get();
            repository.delete(neighborhood);
            return true;
        }
    }

    private NeighborhoodResponse getBean(py.com.econtreras.api.entity.Neighborhood neighborhood){
        links = cargarEnlaces(neighborhood);
        if (links == null || links.length == 0){
            return converter.buildBean(neighborhood);
        }else{
            return converter.buildBean(neighborhood, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.Neighborhood neighborhood){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/neighborhood/" + neighborhood.getId()).withSelfRel());
        if (neighborhood.getCity() != null) {
            link = new Link("http://localhost:8080/cities/" + neighborhood.getCity().getId()).withRel("city");
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
