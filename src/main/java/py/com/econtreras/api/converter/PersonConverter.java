package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Person;
import py.com.econtreras.api.repository.DocumentTypeRepository;
import py.com.econtreras.api.repository.PersonTypeRepository;

@Component
public class PersonConverter {

    @Autowired
    PersonTypeRepository personTypeRepository;

    @Autowired
    DocumentTypeRepository documentTypeRepository;

    public Person buildEntity(py.com.econtreras.api.beans.PersonRequest bean) {
        Person entity = new Person();
        entity.setId(bean.getId());
        entity.setName(bean.getName());
        entity.setLastname(bean.getLastname());
        entity.setBusinessName(bean.getBusinessName());
        entity.setDocumentNumber(bean.getDocumentNumber());
        entity.setBirthday(bean.getBirthday());
        entity.setEmail(bean.getEmail());
        entity.setPhone(bean.getPhone());
        entity.setCellphone(bean.getCellphone());
        entity.setDocumentType(documentTypeRepository.findById(bean.getDocumentTypeId()).get());
        entity.setPersonType(personTypeRepository.findById(bean.getPersonTypeId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.PersonResponse buildBean(Person entity) {
        py.com.econtreras.api.beans.PersonResponse bean = new py.com.econtreras.api.beans.PersonResponse();
        bean.setPersonId(entity.getId());
        bean.setName(entity.getName());
        bean.setLastname(entity.getLastname());
        bean.setBusinessName(entity.getBusinessName());
        bean.setDocumentNumber(entity.getDocumentNumber());
        bean.setBirthday(entity.getBirthday());
        bean.setEmail(entity.getEmail());
        bean.setPhone(entity.getPhone());
        bean.setCellphone(entity.getCellphone());
        return bean;
    }
    
    public py.com.econtreras.api.beans.PersonResponse buildBean(Person entity, Link... links) {
        py.com.econtreras.api.beans.PersonResponse bean = new py.com.econtreras.api.beans.PersonResponse();
        bean.setPersonId(entity.getId());
        bean.setName(entity.getName());
        bean.setLastname(entity.getLastname());
        bean.setBusinessName(entity.getBusinessName());
        bean.setDocumentNumber(entity.getDocumentNumber());
        bean.setBirthday(entity.getBirthday());
        bean.setEmail(entity.getEmail());
        bean.setPhone(entity.getPhone());
        bean.setCellphone(entity.getCellphone());
        bean.add(links);
        return bean;
    }
}
