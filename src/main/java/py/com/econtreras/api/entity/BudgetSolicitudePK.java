package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class BudgetSolicitudePK implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "producto", nullable = false)
    private int productId;
    @Basic(optional = false)
    @Column(name = "sol_presupuesto", nullable = false)
    private int budgetSolicitudeId;
	
    public BudgetSolicitudePK(int productId, int budgetSolicitudeId) {
		super();
		this.productId = productId;
		this.budgetSolicitudeId = budgetSolicitudeId;
	}
    
}
