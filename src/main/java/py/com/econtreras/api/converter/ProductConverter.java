package py.com.econtreras.api.converter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;

import py.com.econtreras.entity.Product;
import py.com.econtreras.api.repository.BrandRepository;
import py.com.econtreras.api.repository.CategoryRepository;

@Component
public class ProductConverter {

    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    BrandRepository brandRepository;
   /* @Autowired
    private ImageConverter imgConverter;*/
    
    public Product buildEntity(py.com.econtreras.api.beans.ProductRequest bean) {
        Product entity = new Product();
        
        /*List<Image> images = new ArrayList<>();
        for (String src: bean.getPictures()) {
        	Image imgEntity = new Image();
        	imgEntity.setSrc(src);
        	images.add(imgEntity);
		}*/
        entity.setId(bean.getId());
        entity.setCode(bean.getCode());
        entity.setBarCode(bean.getBarCode());
        entity.setProductName(bean.getProductName());
        entity.setDescription(bean.getDescription());
        entity.setTaxtType(bean.getTaxtType());
        
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
        bean.setErased(entity.getErased());
        return bean;
    }
    
    public py.com.econtreras.api.beans.ProductResponse buildBean(Product entity, Link... links) {
        py.com.econtreras.api.beans.ProductResponse bean = new py.com.econtreras.api.beans.ProductResponse();
        bean.setIdProduct(entity.getId());
        bean.setCode(entity.getCode());
        bean.setBarCode(entity.getBarCode());
        bean.setProductName(entity.getProductName());
        bean.setDescription(entity.getDescription());
        bean.setErased(entity.getErased());
        bean.add(links);
        return bean;
    }

    public Product buildEntity(py.com.econtreras.api.beans.ProductBean bean) {
        Product entity = new Product();
        entity.setId(bean.getId());
        entity.setCode(bean.getCode());
        entity.setProductName(bean.getProductName());
        entity.setDescription(bean.getDescription());
        entity.setTaxtType(bean.getTaxtType());
        return entity;
    }
}
