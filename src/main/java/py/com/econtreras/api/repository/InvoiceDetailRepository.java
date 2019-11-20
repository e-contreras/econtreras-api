package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.SalesInvoiceDetail;
import py.com.econtreras.entity.SalesInvoiceDetailPK;

public interface InvoiceDetailRepository extends CrudRepository<SalesInvoiceDetail, SalesInvoiceDetailPK> {
}
