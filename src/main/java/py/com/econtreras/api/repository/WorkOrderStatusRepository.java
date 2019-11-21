package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.WorkOrderStatus;

import java.util.Optional;

public interface WorkOrderStatusRepository extends CrudRepository<WorkOrderStatus, Integer> {

    Optional<WorkOrderStatus> findByDescription(String description);
}
