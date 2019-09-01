package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.Address;

public interface AddressRepository extends CrudRepository<Address, Integer> {

}
