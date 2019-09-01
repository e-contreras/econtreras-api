package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.Fee;

public interface FeeRepository extends CrudRepository<Fee, Integer> {

}
