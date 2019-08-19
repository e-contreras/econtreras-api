
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
@Table(name = "fac_compras", catalog = "econtreras", schema = "")
public class PurchaseInvoice implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fecha", nullable = false, length = 45)
    private String date;
    @Basic(optional = false)
    @Column(name = "num_factura", nullable = false, length = 45)
    private String invoiceNumber;
    @Column(name = "fec_alta")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "fec_modificacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificationDate;
    @OneToMany(mappedBy = "purchaseInvoice")
    private List<Inventory> inventoryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "purchaseInvoice")
    private List<PaymentProvider> paymentProviderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "purchaseInvoice")
    private List<PurchaseInvoiceDetail> purchaseInvoiceDetailList;
    @JoinColumn(name = "proveedor", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Provider provider;
    @JoinColumn(name = "sol_presupuesto", referencedColumnName = "id")
    @ManyToOne
    private BugetSolicitude bugetSolicitude;
    @JoinColumn(name = "usu_alta", referencedColumnName = "id")
    @ManyToOne
    private User creationUser;
    @JoinColumn(name = "usu_modificacion", referencedColumnName = "id")
    @ManyToOne
    private User modificationUser;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "purchaseInvoice")
    private List<RemissionNote> remissionNoteList;

}
