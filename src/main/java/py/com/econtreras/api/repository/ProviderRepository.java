package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.api.entity.Provider;

public interface ProviderRepository extends CrudRepository<Provider, Integer> {

}
