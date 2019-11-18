package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Address;

public interface AddressRepository extends CrudRepository<Address, Integer> {

}
