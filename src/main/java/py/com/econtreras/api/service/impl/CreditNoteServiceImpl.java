package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.CreditNote;
import py.com.econtreras.api.converter.CreditNoteConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.CreditNoteRepository;
import py.com.econtreras.api.service.CreditNoteService;

@Service
public class CreditNoteServiceImpl implements CreditNoteService {

    @Autowired
    private CreditNoteRepository creditNoteRepository;

    @Autowired
    private CreditNoteConverter creditNoteConverter;

    @Autowired
    ApiMessage message;

    private static final Logger LOGGER = LogManager.getLogger(CreditNoteServiceImpl.class);

    @Override
    public CreditNote findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.CreditNote> optional = creditNoteRepository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return creditNoteConverter.buildBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<CreditNote> findAll() {
        try {
            Iterable<py.com.econtreras.entity.CreditNote> entityList = creditNoteRepository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<CreditNote> beans = new ArrayList<>();
            for (py.com.econtreras.entity.CreditNote entity : entityList) {
                beans.add(creditNoteConverter.buildBean(entity));
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
    public CreditNote save(CreditNote creditNote) {
        try {
            return creditNoteConverter.buildBean(creditNoteRepository.save(creditNoteConverter.buildEntity(creditNote)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public CreditNote update(CreditNote creditNote) {
        try {
            Optional<py.com.econtreras.entity.CreditNote> optionalEntity = creditNoteRepository.findById(creditNote.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                Date creationDate = optionalEntity.get().getCreationDate() != null ? optionalEntity.get().getCreationDate() : null;
                py.com.econtreras.entity.CreditNote creditNoteEntity = creditNoteRepository.save(creditNoteConverter.buildEntity(creditNote));
                creditNoteEntity.setCreationDate(creationDate);
                return creditNoteConverter.buildBean(creditNoteEntity);
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
            creditNoteRepository.deleteById(id);
            return true;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }
}
