package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.PersonType;
import py.com.econtreras.api.converter.PersonTypeConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.PersonTypeRepository;
import py.com.econtreras.api.service.PersonTypeService;

@Service
public class PersonTypeServiceImpl implements PersonTypeService {

    @Autowired
    private PersonTypeRepository repository;
    @Autowired
    private PersonTypeConverter converter;
    @Autowired
    ApiMessage message;
    private static final Logger LOGGER = LogManager.getLogger(PersonTypeServiceImpl.class);

    @Override
    public PersonType findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.PersonType> optional = repository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<PersonType> findAll() {
        try {

            Iterable<py.com.econtreras.entity.PersonType> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<PersonType> beans = new ArrayList<>();
            for (py.com.econtreras.entity.PersonType entity : entityList) {
                beans.add(converter.buildBean(entity));
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
    public PersonType save(PersonType personType) {
        try {
            return converter.buildBean(repository.save(converter.buildEntity(personType)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }
    
    
    @Override
    public PersonType update(PersonType personType) {
        try {
            Optional<py.com.econtreras.entity.PersonType> optionalEntity = repository.findById(personType.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repository.save(converter.buildEntity(personType)));
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
        try {
            repository.deleteById(id);
            return true;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

}
