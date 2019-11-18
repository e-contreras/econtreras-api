package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.entity.Category;
import py.com.econtreras.api.repository.CategoryRepository;

@Component
public class CategoryConverter {
    
    @Autowired
    CategoryRepository categoryRepository;

    public Category buildEntity(py.com.econtreras.api.beans.CategoryRequest bean) {
        Category entity = new Category();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        if (bean.getSuperCategoryId() != null && !bean.getSuperCategoryId().equals(0)) {
            entity.setSuperCategory(categoryRepository.findById(bean.getSuperCategoryId()).get());
        }
        return entity;
    }

    public py.com.econtreras.api.beans.CategoryResponse buildBean(Category entity) {
        py.com.econtreras.api.beans.CategoryResponse bean = new py.com.econtreras.api.beans.CategoryResponse();
        bean.setCategoryId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }
    
    public py.com.econtreras.api.beans.CategoryResponse buildBean(Category entity, Link... links) {
        py.com.econtreras.api.beans.CategoryResponse bean = new py.com.econtreras.api.beans.CategoryResponse();
        bean.setCategoryId(entity.getId());
        bean.setDescription(entity.getDescription());
        bean.add(links);
        return bean;
    }
}
