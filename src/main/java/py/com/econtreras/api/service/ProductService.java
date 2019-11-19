package py.com.econtreras.api.service;

import py.com.econtreras.api.beans.ProductRequest;
import py.com.econtreras.api.beans.ProductResponse;
import py.com.econtreras.api.beans.Productstore;

import java.util.List;

public interface ProductService extends GenericService<ProductRequest, ProductResponse, Integer> {

    List<Productstore> findAllProductStore();
    
}
