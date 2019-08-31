package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.Neighborhood;

public interface NeighborhoodRepository extends CrudRepository<Neighborhood, Integer>  {

}
