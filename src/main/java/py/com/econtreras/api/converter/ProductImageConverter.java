package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;

import py.com.econtreras.api.beans.ProductImageResponse;
import py.com.econtreras.entity.ProductImage;


@Component
public class ProductImageConverter {
	
	public ProductImage buildEntity(ProductImageResponse bean) {
		ProductImage entity = new ProductImage();
		
		return entity;
	}
	
	public ProductImageResponse buildResponse(ProductImage entity) {
		return null;
	}

}
