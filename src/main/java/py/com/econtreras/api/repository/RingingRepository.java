package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.Ringing;

public interface RingingRepository extends CrudRepository<Ringing, Integer> {

        @Query("select r from Ringing  r where r.validityDate = (select max(rm.validityDate) from Ringing  rm where rm.documentType = :documentType) AND r.documentType = :documentType")
        Ringing getMax(@Param("documentType") String documentType);

}
