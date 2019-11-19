package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Product;
import py.com.econtreras.entity.ProductImage;
import py.com.econtreras.entity.ProductImagePK;

import java.util.List;

public interface ProductImageRepository extends CrudRepository<ProductImage, ProductImagePK> {

    List<ProductImage> findByProduct(Product product);

}
