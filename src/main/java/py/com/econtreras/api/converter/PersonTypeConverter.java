package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.entity.PersonType;

@Component
public class PersonTypeConverter {

    public PersonType buildEntity(py.com.econtreras.api.beans.PersonType bean) {
        PersonType entity = new PersonType();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        entity.setAbbreviation(bean.getAbbreviation());
        return entity;
    }

    public py.com.econtreras.api.beans.PersonType buildBean(PersonType entity) {
        py.com.econtreras.api.beans.PersonType bean = new py.com.econtreras.api.beans.PersonType();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        bean.setAbbreviation(entity.getAbbreviation());
        return bean;
    }
}
