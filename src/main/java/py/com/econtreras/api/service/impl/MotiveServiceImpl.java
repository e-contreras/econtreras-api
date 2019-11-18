package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.Motive;
import py.com.econtreras.api.converter.MotiveConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.MotiveRepository;
import py.com.econtreras.api.service.MotiveService;

@Service
public class MotiveServiceImpl implements MotiveService {

    @Autowired
    private ApiMessage message;
    @Autowired
    private MotiveConverter converter;
    @Autowired
    private MotiveRepository repository;
    private static final Logger LOGGER = LogManager.getLogger(MotiveServiceImpl.class);

    @Override
    public Motive findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Motive> optionalEntity = repository.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }
            return converter.buildBean(optionalEntity.get());
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<Motive> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Motive> iEntity = repository.findAll();
            List<Motive> departamentList = new ArrayList<>();

            for (py.com.econtreras.api.entity.Motive motive : iEntity) {
                departamentList.add(converter.buildBean(motive));
            }
            return departamentList;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Motive save(Motive motive) {
        try {
            if (motive.getId() == null && repository.findByMotiveName(motive.getDescription()) != null) {
                throw new APIException(HttpStatus.UNPROCESSABLE_ENTITY, message.getAlreadyExistMessage());
            }
            py.com.econtreras.api.entity.Motive entity = repository.save(converter.buildEntity(motive));
            return converter.buildBean(entity);
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }

    }

    @Override
    public Motive update(Motive motive) {
        try {
            Optional<py.com.econtreras.api.entity.Motive> optionalEntity = repository.findById(motive.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repository.save(converter.buildEntity(motive)));
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
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
