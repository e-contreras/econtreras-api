
package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class ProductBudgetPK implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "mercaderia", nullable = false)
    private int mercaderia;
    @Basic(optional = false)
    @Column(name = "presupuesto", nullable = false)
    private int presupuesto;

    public ProductBudgetPK(int mercaderia, int presupuesto) {
        this.mercaderia = mercaderia;
        this.presupuesto = presupuesto;
    }
    
}
