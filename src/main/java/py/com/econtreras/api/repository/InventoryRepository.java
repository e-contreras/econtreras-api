package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.Inventory;
import py.com.econtreras.entity.Product;

import java.util.List;

public interface InventoryRepository extends CrudRepository<Inventory, Integer> {

    @Query(value = "SELECT sum(i.operationQuantity) FROM Inventory i where i.product.id = :productId and i.operationType in(:motive)")
    Long countByProductIdAndMotive(@Param("productId") Integer productId, @Param("motive")String motive);

    List<Inventory> findByProduct(Product product);
}
