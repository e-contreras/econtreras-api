
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
@Table(name = "pro_not_remisiones", catalog = "econtreras", schema = "")
public class RemissionNote implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "num_documento", nullable = false, length = 45)
    private String documentNumber;
    @Column(name = "fec_expedicion")
    @Temporal(TemporalType.DATE)
    private Date expirationDate;
    @Column(name = "fec_traslado")
    @Temporal(TemporalType.DATE)
    private Date initTransferDate;
    @Column(name = "fec_fin_traslado")
    @Temporal(TemporalType.DATE)
    private Date endTransferDate;
    @Column(name = "fec_alta")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "fec_modificacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificationDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "remissionNote")
    private List<ProductRemissionNote> productRemissionNoteList;
    @JoinColumn(name = "fac_compra", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private PurchaseInvoice purchaseInvoice;
    @JoinColumn(name = "proveedor", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Provider provider;
    @JoinColumn(name = "usu_alta", referencedColumnName = "id")
    @ManyToOne
    private User creationUser;
    @JoinColumn(name = "usu_modificacion", referencedColumnName = "id")
    @ManyToOne
    private User modificationUser;
}
