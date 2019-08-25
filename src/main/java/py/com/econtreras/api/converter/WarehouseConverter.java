package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Warehouse;

@Component
public class WarehouseConverter {

    public Warehouse buildEntity(py.com.econtreras.api.beans.Warehouse bean) {
        Warehouse entity = new Warehouse();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        entity.setAddress(bean.getAddress());
        return entity;
    }

    public py.com.econtreras.api.beans.Warehouse buildBean(Warehouse entity) {
        py.com.econtreras.api.beans.Warehouse bean = new py.com.econtreras.api.beans.Warehouse();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        bean.setAddress(entity.getAddress());
        return bean;
    }
}
