package py.com.econtreras.api.converter;

import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Product;

@Component
public class ProductConverter {

    public Product buildEntity(py.com.econtreras.api.beans.Product bean) {
        Product entity = new Product();
        entity.setId(bean.getIdProduct());
        entity.setCode(bean.getCode());
        entity.setBarCode(bean.getBarCode());
        entity.setProductName(bean.getProductName());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.Product buildBean(Product entity) {
        py.com.econtreras.api.beans.Product bean = new py.com.econtreras.api.beans.Product();
        bean.setIdProduct(entity.getId());
        bean.setCode(entity.getCode());
        bean.setBarCode(entity.getBarCode());
        bean.setProductName(entity.getProductName());
        bean.setDescription(entity.getDescription());
        return bean;
    }
    
    public py.com.econtreras.api.beans.Product buildBean(Product entity, Link... links) {
        py.com.econtreras.api.beans.Product bean = new py.com.econtreras.api.beans.Product();
        bean.setIdProduct(entity.getId());
        bean.setCode(entity.getCode());
        bean.setBarCode(entity.getBarCode());
        bean.setProductName(entity.getProductName());
        bean.setDescription(entity.getDescription());
        bean.add(links);
        return bean;
    }
}
