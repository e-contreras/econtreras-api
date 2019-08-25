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
import py.com.econtreras.api.beans.Warehouse;
import py.com.econtreras.api.converter.WarehouseConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.WarehouseRepository;
import py.com.econtreras.api.service.WarehouseService;

@Service
public class WarehouseServiceImpl implements WarehouseService {

    @Autowired
    private WarehouseRepository repo;
    @Autowired
    private WarehouseConverter converter;
    @Autowired
    ApiMessage message;
    private static final Logger LOGGER = LogManager.getLogger(WarehouseServiceImpl.class);

    @Override
    public Warehouse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Warehouse> optional = repo.findById(id);
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
    public List<Warehouse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Warehouse> entityList = repo.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<Warehouse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Warehouse entity : entityList) {
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
    public Warehouse save(Warehouse warehouse) {
        try {
            return converter.buildBean(repo.save(converter.buildEntity(warehouse)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Warehouse update(Integer id, Warehouse warehouse) {
        try {
            Optional<py.com.econtreras.api.entity.Warehouse> optionalEntity = repo.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repo.save(converter.buildEntity(warehouse)));
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
        Optional<py.com.econtreras.api.entity.Warehouse> optionalEntity = repo.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Warehouse warehouse = optionalEntity.get();
            warehouse.setErased(new Short("1"));
            repo.save(warehouse);
            return true;
        }
    }

}
