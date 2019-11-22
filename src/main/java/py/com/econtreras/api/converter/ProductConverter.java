package py.com.econtreras.api.converter;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;

import py.com.econtreras.entity.Product;
import py.com.econtreras.api.repository.BrandRepository;
import py.com.econtreras.api.repository.CategoryRepository;
import py.com.econtreras.api.repository.ProductImageRepository;
import py.com.econtreras.entity.ProductImage;

@Component
public class ProductConverter {

    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    BrandRepository brandRepository;
    @Autowired
    CategoryConverter categoriConverter;
    @Autowired
    private ProductImageRepository productImageRepository;

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
        bean.setBrand(brandRepository.findById(entity.getBrand().getId()).get().getDescription());
        bean.setCategory(categoriConverter.buildBean(categoryRepository.findById(entity.getCategory().getId()).get()));

        List<ProductImage> productImages = productImageRepository.findByProduct(entity);
        List<String> images = new ArrayList<>();
        productImages.forEach(productImage -> {
            if (productImage.getImage() != null && productImage.getImage().getSrc() != null) {
                images.add(Base64.getEncoder().encodeToString(productImage.getImage().getSrc()));
            }

        });

        bean.setImages(images);
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
        bean.setBrand(brandRepository.findById(entity.getBrand().getId()).get().getDescription());
        bean.setCategory(categoriConverter.buildBean(categoryRepository.findById(entity.getCategory().getId()).get()));

        List<ProductImage> productImages = productImageRepository.findByProduct(entity);
        List<String> images = new ArrayList<>();
        productImages.forEach(productImage -> {
            if (productImage.getImage() != null && productImage.getImage().getSrc() != null) {
                images.add(Base64.getEncoder().encodeToString(productImage.getImage().getSrc()));
            }

        });

        bean.setImages(images);
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
