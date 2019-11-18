package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {

}
