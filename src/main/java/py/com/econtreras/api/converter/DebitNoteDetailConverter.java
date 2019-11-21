package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.repository.DebitNoteRepository;

import py.com.econtreras.entity.DebitNoteDetail;

@Component
public class DebitNoteDetailConverter {
    
    @Autowired
    private DebitNoteRepository debitNoteRepository;
    
    public DebitNoteDetail buildEntity(py.com.econtreras.api.beans.DebitNoteDetail bean) {
        DebitNoteDetail entity = new DebitNoteDetail();
        entity.setId(bean.getId());
        entity.setConcept(bean.getConcept());
        entity.setQuantity(bean.getQuantity());
        entity.setTaxeType(bean.getTaxeType());
        entity.setDebitNote(debitNoteRepository.findById(bean.getDebitNote()).get());
        return entity;
    }
    
    public py.com.econtreras.api.beans.DebitNoteDetail buildBean(DebitNoteDetail entity) {
        py.com.econtreras.api.beans.DebitNoteDetail bean = new py.com.econtreras.api.beans.DebitNoteDetail();
        bean.setId(entity.getId());
        bean.setConcept(entity.getConcept());
        bean.setQuantity(entity.getQuantity());
        bean.setTaxeType(entity.getTaxeType());
        bean.setDebitNote(entity.getDebitNote().getId());
        return bean;
    }
    
}
