package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.ProductImageRequest;

import py.com.econtreras.entity.ProductImage;

@Component
public class ProductImageConverter {

    @Autowired
    private ImageConverter imageConverter;
    @Autowired
    private ProductConverter productConverter;

    public ProductImage buildEntity(ProductImageRequest bean) {
        ProductImage entity = new ProductImage();
        entity.setPrincipal(bean.getPrincipal());
        entity.setImage(imageConverter.buildEntity(bean.getImagen()));
        entity.setProduct(productConverter.buildEntity(bean.getProduct()));
        return entity;
    }
}
