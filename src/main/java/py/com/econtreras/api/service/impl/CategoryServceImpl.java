package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.Category;
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
    
    private static final Logger LOGGER = LogManager.getLogger(CategoryServceImpl.class);

    @Override
    public Category findById(Integer id) {
        try {
            Optional<py.com.econtreras.api.entity.Category> optional = repo.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<Category> findAll() {
        try {
            Iterable<py.com.econtreras.api.entity.Category> entityList = repo.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<Category> beans = new ArrayList<>();
            for (py.com.econtreras.api.entity.Category entity : entityList) {
                beans.add(converter.buildBean(entity));
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
    public Category save(Category category) {
        try {
            return converter.buildBean(repo.save(converter.buildEntity(category)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Category update(Integer id, Category category) {
        try {
            Optional<py.com.econtreras.api.entity.Category> optionalEntity = repo.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repo.save(converter.buildEntity(category)));
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

}
