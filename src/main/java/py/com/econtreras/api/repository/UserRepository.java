package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.User;

public interface UserRepository extends CrudRepository<User, Integer> {

}
