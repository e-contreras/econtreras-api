package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.Product;

public interface ProductService {

    Product findById(Integer id);

    List<Product> findAll();

    Product save(Product product);

    Product update(Integer id, Product product);

    Boolean delete(Integer id);
}
