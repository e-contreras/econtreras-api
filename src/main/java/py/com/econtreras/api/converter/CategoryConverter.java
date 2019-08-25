package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Category;

@Component
public class CategoryConverter {

    public Category buildEntity(py.com.econtreras.api.beans.Category bean) {
        Category entity = new Category();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.Category buildBean(Category entity) {
        py.com.econtreras.api.beans.Category bean = new py.com.econtreras.api.beans.Category();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }
}
