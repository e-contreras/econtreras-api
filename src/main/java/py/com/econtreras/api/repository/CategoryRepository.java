package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {
    
}
