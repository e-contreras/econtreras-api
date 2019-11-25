package py.com.econtreras.api.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.DebitNoteDetail;

public interface DebitNoteDetailRepository extends CrudRepository<DebitNoteDetail, Integer> {

    @Query("SELECT D FROM DebitNoteDetail D WHERE D.debitNote.id = :debit_id")
    public List<DebitNoteDetail> findByDebitId(@Param("debit_id") Integer id);    
    
}
