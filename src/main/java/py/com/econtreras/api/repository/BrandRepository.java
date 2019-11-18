package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Brand;

public interface BrandRepository extends CrudRepository<Brand, Integer> {
    
}
