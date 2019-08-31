package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.NeighborhoodRequest;
import py.com.econtreras.api.beans.NeighborhoodResponse;

public interface NeighborhoodService  {

    NeighborhoodResponse findById(Integer id);

    List<NeighborhoodResponse> findAll();

    NeighborhoodResponse save(NeighborhoodRequest neighborhood);
    
    NeighborhoodResponse update(Integer id, NeighborhoodRequest neighborhood);

    Boolean delete(Integer id);
}
