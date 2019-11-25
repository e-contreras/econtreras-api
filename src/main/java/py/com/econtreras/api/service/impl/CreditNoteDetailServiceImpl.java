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
import py.com.econtreras.api.beans.CreditNoteDetail;
import py.com.econtreras.api.converter.CreditNoteDetailConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.CreditNoteDetailRepository;
import py.com.econtreras.api.service.CreditNoteDetailService;

@Service
public class CreditNoteDetailServiceImpl implements CreditNoteDetailService {

    @Autowired
    private CreditNoteDetailRepository creditNoteDetailRepository;

    @Autowired
    private CreditNoteDetailConverter creditNoteDetailConverter;

    @Autowired
    ApiMessage message;

    private static final Logger LOGGER = LogManager.getLogger(CreditNoteDetailServiceImpl.class);
    
    public List<CreditNoteDetail> findByCreditId(Integer id){
        return creditNoteDetailConverter.buildBeans(creditNoteDetailRepository.findByCreditId(id));
    }

    @Override
    public CreditNoteDetail findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.CreditNoteDetail> optional = creditNoteDetailRepository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return creditNoteDetailConverter.buildBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<CreditNoteDetail> findAll() {
        try {
            Iterable<py.com.econtreras.entity.CreditNoteDetail> entityList = creditNoteDetailRepository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<CreditNoteDetail> beans = new ArrayList<>();
            for (py.com.econtreras.entity.CreditNoteDetail entity : entityList) {
                beans.add(creditNoteDetailConverter.buildBean(entity));
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
    public CreditNoteDetail save(CreditNoteDetail creditNoteDetail) {
        try {
            return creditNoteDetailConverter.buildBean(creditNoteDetailRepository.save(creditNoteDetailConverter.buildEntity(creditNoteDetail)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public CreditNoteDetail update(CreditNoteDetail creditNoteDetail) {
        try {
            Optional<py.com.econtreras.entity.CreditNoteDetail> optionalEntity = creditNoteDetailRepository.findById(creditNoteDetail.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return creditNoteDetailConverter.buildBean(creditNoteDetailRepository.save(creditNoteDetailConverter.buildEntity(creditNoteDetail)));
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
            creditNoteDetailRepository.deleteById(id);
            return true;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }
}
