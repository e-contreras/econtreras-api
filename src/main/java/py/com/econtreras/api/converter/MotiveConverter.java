package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;

import py.com.econtreras.api.entity.Motive;

@Component
public class MotiveConverter {

    public Motive buildEntity(py.com.econtreras.api.beans.Motive bean) {
        Motive entity = new Motive();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.Motive buildBean(Motive entity) {
        py.com.econtreras.api.beans.Motive bean = new py.com.econtreras.api.beans.Motive();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }

}
