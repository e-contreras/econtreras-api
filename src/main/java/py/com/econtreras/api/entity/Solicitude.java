
package py.com.econtreras.api.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "solicitudes", catalog = "econtreras", schema = "")
public class Solicitude implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fec_creacion", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "fec_confirmacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date confirmationDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "solicitude")
    private List<WorkOrder> workOrderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "solicitude")
    private List<ProdcutSolicitude> prodcutSolicitudeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "solicitude")
    private List<Payment> paymentList;
    @OneToMany(mappedBy = "solicitude")
    private List<SalesInvoiceDetail> salesInvoiceDetailList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "solicitude")
    private List<Transaction> transactionList;
    @JoinColumn(name = "estado", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private SolicitudeStatus status;
}
