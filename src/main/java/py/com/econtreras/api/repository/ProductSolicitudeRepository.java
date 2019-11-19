package py.com.econtreras.api.repository;

import io.swagger.models.auth.In;
import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.ProductSolicitude;
import py.com.econtreras.entity.ProductSolicitudePK;

public interface ProductSolicitudeRepository extends CrudRepository<ProductSolicitude, ProductSolicitudePK> {




}
