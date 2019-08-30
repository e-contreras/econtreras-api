package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.PersonType;

public interface PersonTypeRepository extends CrudRepository<PersonType, Integer> {

}
