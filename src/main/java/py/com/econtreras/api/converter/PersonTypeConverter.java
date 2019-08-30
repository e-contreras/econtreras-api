package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.PersonType;

@Component
public class PersonTypeConverter {

    public PersonType buildEntity(py.com.econtreras.api.beans.PersonType bean) {
        PersonType entity = new PersonType();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.PersonType buildBean(PersonType entity) {
        py.com.econtreras.api.beans.PersonType bean = new py.com.econtreras.api.beans.PersonType();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }
}
