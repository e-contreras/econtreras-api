package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {

}
