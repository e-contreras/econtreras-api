
package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "fac_ven_detalles", catalog = "econtreras", schema = "")
public class SalesInvoiceDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected SalesInvoiceDetailPK facVenDetallesPK;
    @Basic(optional = false)
    @Column(name = "cant", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "precio", nullable = false)
    private double price;
    @JoinColumn(name = "solicitud", referencedColumnName = "id")
    @ManyToOne
    private Solicitude solicitude;
    @JoinColumn(name = "fac_venta", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private SalesInvoice salesInvoice;
    @JoinColumn(name = "producto", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;
    
}
