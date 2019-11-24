package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Category;

import java.util.Optional;

public interface CategoryRepository extends CrudRepository<Category, Integer> {

    Optional<Category> findByDescription(String description);
    
}
