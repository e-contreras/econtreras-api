
package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@Data
@Entity
@Table(name = "pre_meraderias", catalog = "econtreras", schema = "")
@XmlRootElement
public class ProductBudget implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductBudgetPK preMeraderiasPK;
    @Basic(optional = false)
    @Column(name = "cant", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "precio", nullable = false)
    private double price;
    @Basic(optional = false)
    @Column(name = "tip_impuesto", nullable = false)
    private int taxeType;
    @JoinColumn(name = "mercaderia", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;
    @JoinColumn(name = "presupuesto", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Budget budget;
    
}
