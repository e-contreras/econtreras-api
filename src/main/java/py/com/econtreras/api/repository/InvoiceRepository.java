package py.com.econtreras.api.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import py.com.econtreras.entity.SalesInvoice;

import java.util.Optional;

public interface InvoiceRepository extends CrudRepository<SalesInvoice, Integer> {

    @Query(value = "select s from SalesInvoice s left join s.facVenDetallesList d left join s.client  where s.id = :id")
    Optional<SalesInvoice> findById(@Param("id") Integer id);

}