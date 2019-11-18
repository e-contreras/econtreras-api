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
import py.com.econtreras.api.beans.RoleRequest;
import py.com.econtreras.api.beans.RoleResponse;
import py.com.econtreras.api.converter.RoleConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.RoleRepository;
import py.com.econtreras.api.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository repository;
    @Autowired
    private RoleConverter converter;
    @Autowired
    ApiMessage message;
    private static final Logger LOGGER = LogManager.getLogger(RoleServiceImpl.class);

    @Override
    public RoleResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Role> optional = repository.findById(id);
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
    public List<RoleResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Role> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<RoleResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Role entity : entityList) {
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
    public RoleResponse save(RoleRequest role) {
        try {
            return converter.buildBean(repository.save(converter.buildEntity(role)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public RoleResponse update(RoleRequest role) {
        try {
            Optional<py.com.econtreras.api.entity.Role> optionalEntity = repository.findById(role.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repository.save(converter.buildEntity(role)));
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
        Optional<py.com.econtreras.api.entity.Role> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Role role = optionalEntity.get();
            role.setErased(new Short("1"));
            repository.save(role);
            return true;
        }
    }

}
