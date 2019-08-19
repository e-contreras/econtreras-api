
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name = "timbrados", catalog = "econtreras", schema = "")
public class Ringing implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "timbrado", nullable = false, length = 45)
    private String ringing;
    @Basic(optional = false)
    @Column(name = "fec_validez", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date validityDate;
    @Basic(optional = false)
    @Column(name = "tic_documento", nullable = false, length = 10)
    private String documentType;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ringing")
    private List<CreditNote> creditNoteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ringing")
    private List<SalesInvoice> salesInvoiceList;
    
}
