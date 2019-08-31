package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.City;

public interface CityRepository extends CrudRepository<City, Integer>  {

}
