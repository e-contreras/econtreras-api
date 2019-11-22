package py.com.econtreras.api.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.Tarjetas;

public interface CardRepository extends CrudRepository<Tarjetas, Integer> {

    @Query("SELECT T FROM Tarjetas T WHERE T.cliente.id = :client_id")
    public List<Tarjetas> findByClientId(@Param("client_id") Integer clientId);
    
}
