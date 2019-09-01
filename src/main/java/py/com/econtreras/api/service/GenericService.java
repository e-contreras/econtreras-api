package py.com.econtreras.api.service;

import java.util.List;

public interface GenericService<beanRequest, beanResponse, dataType> {

    beanResponse findById(dataType id);

    List<beanResponse> findAll();

    beanResponse save(beanRequest vehicle);

    beanResponse update(beanRequest vehicle);

    Boolean delete(dataType id);
    
}
