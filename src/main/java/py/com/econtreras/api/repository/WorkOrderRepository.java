package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.WorkOrder;

public interface WorkOrderRepository extends CrudRepository<WorkOrder, Integer> {
}
