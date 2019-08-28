package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.ProductRequest;
import py.com.econtreras.api.beans.ProductResponse;

public interface ProductService {

    ProductResponse findById(Integer id);

    List<ProductResponse> findAll();

    ProductResponse save(ProductRequest product);

    ProductResponse update(Integer id, ProductRequest product);

    Boolean delete(Integer id);
}
