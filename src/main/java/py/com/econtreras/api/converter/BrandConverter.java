package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.entity.Brand;

@Component
public class BrandConverter {

    public Brand buildEntity(py.com.econtreras.api.beans.Brand bean) {
        Brand entity = new Brand();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.Brand buildBean(Brand entity) {
        py.com.econtreras.api.beans.Brand bean = new py.com.econtreras.api.beans.Brand();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }

    public py.com.econtreras.api.beans.BrandBean buildBeanBrand(Brand entity) {
        py.com.econtreras.api.beans.BrandBean bean = new py.com.econtreras.api.beans.BrandBean();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }

}
