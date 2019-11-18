package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.PaymentMethod;

public interface PaymentMethodRepository extends CrudRepository<PaymentMethod, Integer> {

}
