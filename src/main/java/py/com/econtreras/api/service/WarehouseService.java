package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.Warehouse;

public interface WarehouseService {

    Warehouse findById(Integer id);

    List<Warehouse> findAll();

    Warehouse save(Warehouse warehouse);

    Warehouse update(Integer id, Warehouse warehouse);

    Boolean delete(Integer id);
}
