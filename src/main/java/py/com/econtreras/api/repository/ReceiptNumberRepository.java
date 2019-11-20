package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.ReceiptNumber;
import py.com.econtreras.entity.ReceiptNumberPK;

public interface ReceiptNumberRepository extends CrudRepository<ReceiptNumber, ReceiptNumberPK> {

}
