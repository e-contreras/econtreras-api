package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.CityRequest;
import py.com.econtreras.api.beans.CityResponse;

public interface CityService {

    CityResponse findById(Integer id);

    List<CityResponse> findAll();

    CityResponse save(CityRequest city);
    
    CityResponse update(Integer id, CityRequest city);

    Boolean delete(Integer id);
}
