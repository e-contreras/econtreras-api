package py.com.econtreras.api.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.Solicitude;

public interface SolicitudeRepository extends CrudRepository<Solicitude, Integer> {
    
    @Query("SELECT S FROM Solicitude S WHERE S.cliente.id = :client_id")
    public List<Solicitude> findByClientId(@Param("client_id") Integer clientId);
    
}
