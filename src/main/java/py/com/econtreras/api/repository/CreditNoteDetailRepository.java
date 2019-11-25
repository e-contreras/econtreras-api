package py.com.econtreras.api.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.CreditNoteDetail;

public interface CreditNoteDetailRepository extends CrudRepository<CreditNoteDetail, Integer> {
    
    @Query("SELECT D FROM CreditNoteDetail D WHERE D.creditNote.id = :credit_id")
    public List<CreditNoteDetail> findByCreditId(@Param("credit_id") Integer id);

}
