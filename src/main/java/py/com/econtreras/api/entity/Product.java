
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
@Table(name = "mercaderias", catalog = "econtreras", schema = "")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "codigo", nullable = false, length = 45)
    private String code;
    @Basic(optional = true)
    @Column(name = "codigo_barra", nullable = true, length = 130)
    private String barCode;
    @Basic(optional = false)
    @Column(name = "nom_producto", nullable = false, length = 45)
    private String productName;
    @Column(name = "descripcion", length = 255)
    private String description;
    @Basic(optional = false)
    @Column(name = "borrado", nullable = false)
    private short erased;
    @Column(name = "fec_alta")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "fec_modificacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificationDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductImage> productImageList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<TransferDetail> transferDetailList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProdcutSolicitude> prodcutSolicitudeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<BudgetSolicitudeProdcut> budgetSolicitudeProdcutList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<SalesInvoiceDetail> salesInvoiceDetailList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductAtribute> productAtributeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<Devolution> devolutionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<PurchaseInvoiceDetail> purchaseInvoiceDetailList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductRemissionNote> productRemissionNoteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductBudget> productBudgetList;
    @JoinColumn(name = "usu_alta", referencedColumnName = "id")
    @ManyToOne
    private User creationUser;
    @JoinColumn(name = "usu_modificacion", referencedColumnName = "id")
    @ManyToOne
    private User modificationUser;
    @JoinColumn(name = "categoria", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Category category;
    @JoinColumn(name = "marca", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Brand brand;    
}
