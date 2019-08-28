package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.CategoryRequest;
import py.com.econtreras.api.beans.CategoryResponse;
import py.com.econtreras.api.converter.CategoryConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.CategoryRepository;
import py.com.econtreras.api.service.CategoryService;

@Service
public class CategoryServceImpl implements CategoryService{

    @Autowired
    private CategoryRepository repo;
    @Autowired
    private CategoryConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(CategoryServceImpl.class);

    @Override
    public CategoryResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Category> optional = repo.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<CategoryResponse> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Category> entityList = repo.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<CategoryResponse> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Category entity : entityList) {
                beans.add(this.getBean(entity));
            }
            return beans;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public CategoryResponse save(CategoryRequest category) {
        try {
            return this.getBean(repo.save(converter.buildEntity(category)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public CategoryResponse update(Integer id, CategoryRequest category) {
        try {
            Optional<py.com.econtreras.api.entity.Category> optionalEntity = repo.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repo.save(converter.buildEntity(category)));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Boolean delete(Integer id) {
        Optional<py.com.econtreras.api.entity.Category> optionalEntity = repo.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.api.entity.Category category = optionalEntity.get();
            category.setErased(new Short("1"));
            repo.save(category);
            return true;
        }
    }

    
    private CategoryResponse getBean(py.com.econtreras.api.entity.Category category){
        links = cargarEnlaces(category);
        if (links == null || links.length == 0){
            return converter.buildBean(category);
        }else{
            return converter.buildBean(category, links);
        }
    }
    
    private Link[] cargarEnlaces(py.com.econtreras.api.entity.Category category){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/categories/" + category.getId()).withSelfRel());
        if (category.getSuperCategory()!= null) {
            link = new Link("http://localhost:8080/categories/" + category.getSuperCategory().getId()).withRel("super_category");
            l.add(link);
        }
        
        Link[] linkArray = new Link[l.size()];
        for (int i = 0; i < l.size(); i++) {
            Link lo = l.get(i);
            linkArray[i] = lo;
        }
        return linkArray;
    }
}
