package py.com.econtreras.api.converter;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.entity.Provider;
import py.com.econtreras.api.repository.DocumentTypeRepository;
import py.com.econtreras.api.repository.PersonRepository;
import py.com.econtreras.api.repository.PersonTypeRepository;

@Component
public class ProviderConverter {
    
    @Autowired
    PersonTypeRepository personTypeRepository;
    
    @Autowired
    PersonRepository personRepository;
    
    @Autowired
    DocumentTypeRepository documentTypeRepository;
    
    public Provider buildEntity(py.com.econtreras.api.beans.ProviderRequest bean) {
        Provider entity = new Provider();
        entity.setId(bean.getId());
        if (bean.getId() == null) {
            entity.setCreationDate(new Date());
        } else {
            entity.setModificationDate(new Date());
        }
        entity.setPerson(personRepository.findById(bean.getPersonId()).get());
        return entity;
    }
    
    public py.com.econtreras.api.beans.ProviderResponse buildBean(Provider entity) {
        py.com.econtreras.api.beans.ProviderResponse bean = new py.com.econtreras.api.beans.ProviderResponse();
        bean.setProviderId(entity.getId());
        bean.setPersonId(entity.getPerson() != null ? entity.getPerson().getId() : null);
        bean.setBusinessName(entity.getPerson() != null ? entity.getPerson().getBusinessName() : null);
        bean.setName(entity.getPerson() != null ? entity.getPerson().getName() : null);
        bean.setLastname(entity.getPerson() != null ? entity.getPerson().getLastname() : null);
        bean.setPhone(entity.getPerson() != null ? entity.getPerson().getPhone() : null);
        bean.setCellphone(entity.getPerson() != null ? entity.getPerson().getCellphone() : null);
        bean.setEmail(entity.getPerson() != null ? entity.getPerson().getEmail() : null);
        bean.setBirthday(entity.getPerson() != null ? entity.getPerson().getBirthday() : null);
        bean.setDocumentNumber(entity.getPerson() != null ? entity.getPerson().getDocumentNumber() : null);
        return bean;
    }
    
    public py.com.econtreras.api.beans.ProviderResponse buildBean(Provider entity, Link... links) {
        py.com.econtreras.api.beans.ProviderResponse bean = new py.com.econtreras.api.beans.ProviderResponse();
        bean.setProviderId(entity.getId());
        bean.setPersonId(entity.getPerson() != null ? entity.getPerson().getId() : null);
        bean.setBusinessName(entity.getPerson() != null ? entity.getPerson().getBusinessName() : null);
        bean.setName(entity.getPerson() != null ? entity.getPerson().getName() : null);
        bean.setLastname(entity.getPerson() != null ? entity.getPerson().getLastname() : null);
        bean.setPhone(entity.getPerson() != null ? entity.getPerson().getPhone() : null);
        bean.setCellphone(entity.getPerson() != null ? entity.getPerson().getCellphone() : null);
        bean.setEmail(entity.getPerson() != null ? entity.getPerson().getEmail() : null);
        bean.setBirthday(entity.getPerson() != null ? entity.getPerson().getBirthday() : null);
        bean.setDocumentNumber(entity.getPerson() != null ? entity.getPerson().getDocumentNumber() : null);
        bean.add(links);
        return bean;
    }
}
