
package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "dt_traslado", catalog = "econtreras", schema = "")
public class TransferDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "cant", nullable = false)
    private int quantity;
    @Lob
    @Column(name = "motivo", length = 65535)
    private String motivo;
    @JoinColumn(name = "productos_id", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Product product;
    @JoinColumn(name = "traslado", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Transfer transfer;
}
