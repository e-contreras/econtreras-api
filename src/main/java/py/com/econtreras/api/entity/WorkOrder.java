
package py.com.econtreras.api.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name = "ord_trabajos", catalog = "econtreras", schema = "")
public class WorkOrder implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fec_creacion", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "fec_asignacion", length = 45)
    private String asignation;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "workOrder")
    private List<UndeliberedRemissionNote> remNoEntregadasList;
    @JoinColumn(name = "solicitud", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Solicitude solicitude;
    @JoinColumn(name = "estado", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private WorkOrderStatus status;
    @JoinColumn(name = "traslado", referencedColumnName = "id")
    @ManyToOne
    private Transfer transfer;
    @JoinColumn(name = "per_deposito", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private User wareHousePersonal;    
}
