package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Product;
import py.com.econtreras.api.repository.BrandRepository;
import py.com.econtreras.api.repository.CategoryRepository;

@Component
public class ProductConverter {

    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    BrandRepository brandRepository;
    
    public Product buildEntity(py.com.econtreras.api.beans.ProductRequest bean) {
        Product entity = new Product();
        entity.setId(bean.getProductId());
        entity.setCode(bean.getCode());
        entity.setBarCode(bean.getBarCode());
        entity.setProductName(bean.getProductName());
        entity.setDescription(bean.getDescription());
        entity.setCategory(categoryRepository.findById(bean.getCategoryId()).get());
        entity.setBrand(brandRepository.findById(bean.getBrandId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.ProductResponse buildBean(Product entity) {
        py.com.econtreras.api.beans.ProductResponse bean = new py.com.econtreras.api.beans.ProductResponse();
        bean.setIdProduct(entity.getId());
        bean.setCode(entity.getCode());
        bean.setBarCode(entity.getBarCode());
        bean.setProductName(entity.getProductName());
        bean.setDescription(entity.getDescription());
        return bean;
    }
    
    public py.com.econtreras.api.beans.ProductResponse buildBean(Product entity, Link... links) {
        py.com.econtreras.api.beans.ProductResponse bean = new py.com.econtreras.api.beans.ProductResponse();
        bean.setIdProduct(entity.getId());
        bean.setCode(entity.getCode());
        bean.setBarCode(entity.getBarCode());
        bean.setProductName(entity.getProductName());
        bean.setDescription(entity.getDescription());
        bean.add(links);
        return bean;
    }
}
