package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.Category;

public interface CategoryService {

    Category findById(Integer id);

    List<Category> findAll();

    Category save(Category category);
    
    Category update(Integer id, Category category);

    Boolean delete(Integer id);
}
