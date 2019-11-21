package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.User;

public interface UserRepository extends CrudRepository<User, Integer> {
    
    @Query("SELECT U FROM User U WHERE U.username LIKE :username")
    public User findByUsername(@Param("username") String username);

}
