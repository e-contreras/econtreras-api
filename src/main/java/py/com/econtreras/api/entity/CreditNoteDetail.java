package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "not_cre_detalles", catalog = "econtreras", schema = "")
public class CreditNoteDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "concepto", nullable = false, length = 45)
    private String concept;
    @Basic(optional = false)
    @Column(name = "cant", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "monto", nullable = false)
    private double amount;
    @Basic(optional = false)
    @Column(name = "tip_impuesto", nullable = false)
    private int taxeTaype;
    @JoinColumn(name = "not_credito", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private CreditNote creditNote;
    
}
