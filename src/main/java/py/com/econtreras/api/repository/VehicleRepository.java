package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Vehicle;

public interface VehicleRepository extends CrudRepository<Vehicle, Integer> {

}
