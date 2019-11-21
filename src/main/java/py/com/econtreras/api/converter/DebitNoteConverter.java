package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.repository.UserRepository;
import py.com.econtreras.entity.DebitNote;

@Component
public class DebitNoteConverter {

    @Autowired
    UserRepository userRepository;

    public DebitNote buildEntity(py.com.econtreras.api.beans.DebitNote bean) {
        DebitNote entity = new DebitNote();
        entity.setId(bean.getId());
        entity.setComment(bean.getComment());
        entity.setDocumentNumber(bean.getDocumentNumber());
        entity.setRelatedDocument(bean.getRelatedDocument());
        entity.setSender(userRepository.findById(bean.getSender()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.DebitNote buildBean(DebitNote entity) {
        py.com.econtreras.api.beans.DebitNote bean = new py.com.econtreras.api.beans.DebitNote();
        bean.setId(entity.getId());
        bean.setComment(entity.getComment());
        bean.setDocumentNumber(entity.getDocumentNumber());
        bean.setRelatedDocument(entity.getRelatedDocument());
        bean.setSender(entity.getSender().getId());
        return bean;
    }
}
