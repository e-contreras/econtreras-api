package py.com.econtreras.api.converter;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.repository.RingingRepository;
import py.com.econtreras.api.repository.UserRepository;
import py.com.econtreras.entity.CreditNote;

@Component
public class CreditNoteConverter {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RingingRepository ringingRepository;
    
    @Autowired
    UserConverter userConverter;
    
    @Autowired
    RingingConverter ringingConverter;

    public CreditNote buildEntity(py.com.econtreras.api.beans.CreditNote bean) {
        CreditNote entity = new CreditNote();
        entity.setId(bean.getId());
        entity.setComment(bean.getComment());
        entity.setCreationDate(bean.getId() == null ? new Date() : null);
        entity.setDestiny(userRepository.findById(bean.getDestinatario().getId()).get());
        entity.setModificationDate(bean.getId() != null ? new Date() : null);
        entity.setRelatedDocument(bean.getRelatedDocument());
        entity.setEmisionDate(bean.getEmisionDate());
        entity.setRinging(ringingRepository.findById(bean.getRinging().getId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.CreditNote buildBean(CreditNote entity) {
        py.com.econtreras.api.beans.CreditNote bean = new py.com.econtreras.api.beans.CreditNote();
        bean.setId(entity.getId());
        bean.setComment(entity.getComment());
        bean.setEmisionDate(entity.getEmisionDate());
        bean.setDestinatario(userConverter.buildBean(entity.getDestiny()));
        bean.setRinging(ringingConverter.buildBean(entity.getRinging()));
        bean.setRelatedDocument(entity.getRelatedDocument());
        return bean;
    }
}
