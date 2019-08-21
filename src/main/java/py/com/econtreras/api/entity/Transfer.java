
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
@Table(name = "traslados", catalog = "econtreras", schema = "")
public class Transfer implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "fec_solicitud")
    @Temporal(TemporalType.TIMESTAMP)
    private Date solicitudeDate;
    @Column(name = "fec_pre_traslado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date transferSheduled;
    @Column(name = "fec_traslado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date transferDate;
    @OneToMany(mappedBy = "transfer")
    private List<WorkOrder> workOrderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "transfer")
    private List<TransferDetail> transferDetailList;
    @JoinColumn(name = "dep_origen", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Warehouse origin;
    @JoinColumn(name = "dep_destino", referencedColumnName = "id")
    @ManyToOne
    private Warehouse destiny;
    @JoinColumn(name = "chofer", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private User driver;
    @JoinColumn(name = "vehiculo", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Vehicle vehicle;

}
