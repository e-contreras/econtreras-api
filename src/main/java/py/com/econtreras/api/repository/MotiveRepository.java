package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.Motive;

public interface MotiveRepository extends CrudRepository<Motive, Integer> {

    @Query(value = "SELECT m FROM Motive m WHERE m.description = :motiveName")
    public Motive findByMotiveName(@Param("motiveName") String motiveName);

}
