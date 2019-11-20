package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Client;

public interface ClientRepository extends CrudRepository<Client, Integer> {
}
