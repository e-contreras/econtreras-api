package py.com.econtreras.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
@Table(name = "cuotas", catalog = "econtreras", schema = "")
public class Fee implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Column(name = "cuota")
    private Integer feeNumber;
    @Column(name = "ponderador")
    private BigDecimal ponderator;
    @JoinColumn(name = "categoria_id", referencedColumnName = "id")
    @ManyToOne
    private Category category;

}
