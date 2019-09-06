
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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name = "proveedores", catalog = "econtreras", schema = "")
public class Provider implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "borrado", nullable = false)
    private short erased;
    @Column(name = "fec_alta")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "fec_modificacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificationDate;
    @Column(name = "fec_eliminacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedDate;
    @ManyToMany(mappedBy = "providerList")
    private List<ProductCategory> ProductCategoryList;
    @JoinColumn(name = "persona", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Person person;
    @JoinColumn(name = "usu_alta", referencedColumnName = "id")
    @ManyToOne
    private User creationUser;
    @JoinColumn(name = "usu_modificacion", referencedColumnName = "id")
    @ManyToOne
    private User modificationUser;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "provider")
    private List<PaymentProvider> paymentProviderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "provider")
    private List<PurchaseInvoice> purchaseInvoiceList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "provider")
    private List<RemissionNote> remissionNoteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "provider")
    private List<PurchaseDebitNote> purchaseDebitNoteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "provider")
    private List<Budget> budgetList;
}
