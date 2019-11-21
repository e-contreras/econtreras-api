package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.repository.CreditNoteRepository;
import py.com.econtreras.entity.CreditNoteDetail;

@Component
public class CreditNoteDetailConverter {

    @Autowired
    CreditNoteRepository creditNoteRepository;

    public CreditNoteDetail buildEntity(py.com.econtreras.api.beans.CreditNoteDetail bean) {
        CreditNoteDetail entity = new CreditNoteDetail();
        entity.setId(bean.getId());
        entity.setAmount(bean.getAmount());
        entity.setConcept(bean.getConcept());
        entity.setCreditNote(creditNoteRepository.findById(bean.getIdCreditNote()).get());
        entity.setQuantity(bean.getQuantity());
        entity.setTaxeTaype(bean.getTaxeTaype());
        return entity;
    }

    public py.com.econtreras.api.beans.CreditNoteDetail buildBean(CreditNoteDetail entity) {
        py.com.econtreras.api.beans.CreditNoteDetail bean = new py.com.econtreras.api.beans.CreditNoteDetail();
        bean.setId(entity.getId());
        bean.setAmount(entity.getAmount());
        bean.setConcept(entity.getConcept());
        bean.setIdCreditNote(entity.getCreditNote().getId());
        bean.setQuantity(entity.getQuantity());
        bean.setTaxeTaype(entity.getTaxeTaype());
        return bean;
    }
}
