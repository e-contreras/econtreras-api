package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.SalesInvoice;

public interface InvoiceRepository extends CrudRepository<SalesInvoice, Integer> {
}