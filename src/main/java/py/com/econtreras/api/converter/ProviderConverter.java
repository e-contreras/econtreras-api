package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Person;
import py.com.econtreras.api.entity.Provider;
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
        Person person = new Person();
        entity.setId(bean.getId());
        person.setId(bean.getPersonId());
        person.setName(bean.getName());
        person.setLastname(bean.getLastname());
        person.setBusinessName(bean.getBusinessName());
        person.setDocumentNumber(bean.getDocumentNumber());
        person.setEmail(bean.getEmail());
        person.setPhone(bean.getPhone());
        person.setCellphone(bean.getCellphone());
        person.setDocumentType(documentTypeRepository.findById(bean.getDocumentTypeId()).get());
        person.setPersonType(personTypeRepository.findById(bean.getPersonTypeId()).get());
        entity.setPerson(personRepository.save(person));
        return entity;
    }

    public py.com.econtreras.api.beans.ProviderResponse buildBean(Provider entity) {
        py.com.econtreras.api.beans.ProviderResponse bean = new py.com.econtreras.api.beans.ProviderResponse();
        bean.setProviderId(entity.getId());
        return bean;
    }
    
    public py.com.econtreras.api.beans.ProviderResponse buildBean(Provider entity, Link... links) {
        py.com.econtreras.api.beans.ProviderResponse bean = new py.com.econtreras.api.beans.ProviderResponse();
        bean.setProviderId(entity.getId());
        bean.add(links);
        return bean;
    }
}
