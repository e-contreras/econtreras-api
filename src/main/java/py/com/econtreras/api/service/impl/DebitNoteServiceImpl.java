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
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.DebitNote;
import py.com.econtreras.api.converter.DebitNoteConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.DebitNoteRepository;
import py.com.econtreras.api.service.DebitNoteService;

@Service
public class DebitNoteServiceImpl implements DebitNoteService {

    @Autowired
    private DebitNoteRepository debitNoteRepository;

    @Autowired
    private DebitNoteConverter debitNoteConverter;

    @Autowired
    ApiMessage message;

    private static final Logger LOGGER = LogManager.getLogger(DebitNoteServiceImpl.class);

    @Override
    public DebitNote findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.DebitNote> optional = debitNoteRepository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return debitNoteConverter.buildBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<DebitNote> findAll() {
        try {
            Iterable<py.com.econtreras.entity.DebitNote> entityList = debitNoteRepository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<DebitNote> beans = new ArrayList<>();
            for (py.com.econtreras.entity.DebitNote entity : entityList) {
                beans.add(debitNoteConverter.buildBean(entity));
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
    @Transactional
    public DebitNote save(DebitNote debitNote) {
        try {
            return debitNoteConverter.buildBean(debitNoteRepository.save(debitNoteConverter.buildEntity(debitNote)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public DebitNote update(DebitNote debitNote) {
        try {
            Optional<py.com.econtreras.entity.DebitNote> optionalEntity = debitNoteRepository.findById(debitNote.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return debitNoteConverter.buildBean(debitNoteRepository.save(debitNoteConverter.buildEntity(debitNote)));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public Boolean delete(Integer id) {
        try {
            debitNoteRepository.deleteById(id);
            return true;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }
}
