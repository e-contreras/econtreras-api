package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sol_pre_productos", catalog = "econtreras", schema = "")
public class BudgetSolicitudeProdcut implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BudgetSolicitudePK solPreProductosPK;
    @Basic(optional = false)
    @Column(name = "cant", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "tip_impuesto", nullable = false)
    private int taxeType;
    @JoinColumn(name = "producto", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;
    @JoinColumn(name = "sol_presupuesto", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private BugetSolicitude bugetSolicitude;

    public BudgetSolicitudeProdcut(int producto, int solPresupuesto) {
        this.solPreProductosPK = new BudgetSolicitudePK(producto, solPresupuesto);
    }
    
}
