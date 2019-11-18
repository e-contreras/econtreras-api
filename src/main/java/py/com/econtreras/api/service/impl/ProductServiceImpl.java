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
import py.com.econtreras.api.beans.ProductRequest;
import py.com.econtreras.api.beans.ProductResponse;
import py.com.econtreras.api.converter.ProductConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.ProductRepository;
import py.com.econtreras.api.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository repository;
    @Autowired
    private ProductConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;
    
    private static final Logger LOGGER = LogManager.getLogger(ProductServiceImpl.class);
    
    @Override
    public ProductResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.Product> optional = repository.findById(id);
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
    public List<ProductResponse> findAll() {
        try {
            Iterable<py.com.econtreras.entity.Product> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }
            List<ProductResponse> beans = new ArrayList<>();
            for (py.com.econtreras.entity.Product entity : entityList) {
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
    public ProductResponse save(ProductRequest product) {
        try {
            return this.getBean(repository.save(converter.buildEntity(product)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public ProductResponse update(ProductRequest product) {
        try {
            Optional<py.com.econtreras.entity.Product> optionalEntity = repository.findById(product.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(product)));
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
        Optional<py.com.econtreras.entity.Product> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.entity.Product product = optionalEntity.get();
            product.setErased(new Short("1"));
            repository.save(product);
            return true;
        }
    }
    
    private ProductResponse getBean(py.com.econtreras.entity.Product product){
        links = cargarEnlaces(product);
        if (links == null || links.length == 0){
            return converter.buildBean(product);
        }else{
            return converter.buildBean(product, links);
        }
    }

    private Link[] cargarEnlaces(py.com.econtreras.entity.Product product){
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/products/" + product.getId()).withSelfRel());
        if (product.getBrand() != null) {
            link = new Link("http://localhost:8080/brands/" + product.getBrand().getId()).withRel("brand");
            l.add(link);
        }
        if (product.getCategory() != null) {
            link = new Link("http://localhost:8080/categories/" + product.getCategory().getId()).withRel("category");
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
