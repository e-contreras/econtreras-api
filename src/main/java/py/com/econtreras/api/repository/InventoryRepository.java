package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.Inventory;
import py.com.econtreras.entity.Product;

import java.util.List;

public interface InventoryRepository extends JpaRepository<Inventory, Integer> {

    @Query(value = "select sum(i.cant_operacion) as sum_op from econtreras.inventarios i where i.producto= ?1 and i.tip_operacion in(?2)", nativeQuery = true)
    Long countByProductIdAndMotive(Integer productId, String motive);

    List<Inventory> findByProduct(Product product);
}
