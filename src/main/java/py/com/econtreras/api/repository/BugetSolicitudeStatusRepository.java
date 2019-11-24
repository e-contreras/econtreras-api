package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.BudgetSolicitudeStatus;

import java.util.Optional;

public interface BugetSolicitudeStatusRepository extends CrudRepository<BudgetSolicitudeStatus, Integer> {

    Optional<BudgetSolicitudeStatus> findByStatus(String status);
}