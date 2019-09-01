package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.Person;

public interface PersonRepository extends CrudRepository<Person, Integer> {

}
