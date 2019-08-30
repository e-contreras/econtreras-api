package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.Vehicle;

public interface VehicleService  {

    Vehicle findById(Integer id);

    List<Vehicle> findAll();

    Vehicle save(Vehicle vehicle);

    Vehicle update(Integer id, Vehicle vehicle);

    Boolean delete(Integer id);
}