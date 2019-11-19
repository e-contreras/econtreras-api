package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.SolicitudeStatus;

import java.util.Optional;

public interface SolicitudeStatusRepository extends CrudRepository<SolicitudeStatus, Integer> {

    @Query("select s from SolicitudeStatus s where s.statusName = :status")
    Optional<SolicitudeStatus> findSolicitudeStatusBy(@Param("status") String status);
}