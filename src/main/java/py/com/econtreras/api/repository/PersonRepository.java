package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Person;

public interface PersonRepository extends CrudRepository<Person, Integer> {

}
