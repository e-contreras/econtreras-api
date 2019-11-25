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
import py.com.econtreras.api.beans.DebitNoteDetail;

import py.com.econtreras.api.converter.DebitNoteDetailConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.DebitNoteDetailRepository;
import py.com.econtreras.api.service.NoteDebitDetailService;

@Service
public class DebitNoteDetailServiceImpl implements NoteDebitDetailService {

    @Autowired
    private DebitNoteDetailRepository repository;
    @Autowired
    private DebitNoteDetailConverter converter;
    @Autowired
    ApiMessage message;
    private static final Logger LOGGER = LogManager.getLogger(DebitNoteDetailServiceImpl.class);

    @Override
    public DebitNoteDetail findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.DebitNoteDetail> optional = repository.findById(id);
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

    public List<DebitNoteDetail> findByDebitId(Integer id) {
        return converter.buildBeans(repository.findByDebitId(id));
    }

    @Override
    public List<DebitNoteDetail> findAll() {
        try {
            Iterable<py.com.econtreras.entity.DebitNoteDetail> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<DebitNoteDetail> beans = new ArrayList<>();
            for (py.com.econtreras.entity.DebitNoteDetail entity : entityList) {
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
    public DebitNoteDetail save(DebitNoteDetail debitNoteDetail) {
        try {
            return converter.buildBean(repository.save(converter.buildEntity(debitNoteDetail)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public DebitNoteDetail update(DebitNoteDetail debitNoteDetail) {
        try {
            Optional<py.com.econtreras.entity.DebitNoteDetail> optionalEntity = repository.findById(debitNoteDetail.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repository.save(converter.buildEntity(debitNoteDetail)));
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
