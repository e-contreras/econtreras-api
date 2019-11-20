package py.com.econtreras.api.repository;

import io.swagger.models.auth.In;
import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.ProductSolicitude;
import py.com.econtreras.entity.ProductSolicitudePK;
import py.com.econtreras.entity.Solicitude;

import java.util.List;

public interface ProductSolicitudeRepository extends CrudRepository<ProductSolicitude, ProductSolicitudePK> {
    List<ProductSolicitude> findBySolicitude(Solicitude solicitude);
}
