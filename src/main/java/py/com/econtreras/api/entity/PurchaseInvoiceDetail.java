
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
@Table(name = "fac_comp_detalle", catalog = "econtreras", schema = "")
public class PurchaseInvoiceDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PurchaseInvoiceDetailPK facCompDetallePK;
    @Basic(optional = false)
    @Column(name = "cant", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "precio", nullable = false)
    private double price;
    @JoinColumn(name = "fac_compras_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private PurchaseInvoice purchaseInvoice;
    @JoinColumn(name = "productos_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

}
