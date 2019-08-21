
package py.com.econtreras.api.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class PurchaseInvoiceDetailPK implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "productos_id", nullable = false)
    private int productId;
    @Basic(optional = false)
    @Column(name = "fac_compras_id", nullable = false)
    private int purchaseInvoiceId;
    
}
