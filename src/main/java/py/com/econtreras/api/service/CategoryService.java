package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.CategoryRequest;
import py.com.econtreras.api.beans.CategoryResponse;

public interface CategoryService {

    CategoryResponse findById(Integer id);

    List<CategoryResponse> findAll();

    CategoryResponse save(CategoryRequest category);
    
    CategoryResponse update(Integer id, CategoryRequest category);

    Boolean delete(Integer id);
}
