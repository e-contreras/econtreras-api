package py.com.econtreras.api.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "not_debito", catalog = "econtreras", schema = "")
public class DebitNote implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "num_documento", nullable = false, length = 100)
    private String documentNumber;
    @Basic(optional = false)
    @Column(name = "num_doc_relacionado", nullable = false, length = 100)
    private String relatedDocument;
    @Basic(optional = false)
    @Lob
    @Column(name = "comentario", nullable = false, length = 65535)
    private String comment;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "debitNote")
    private List<DebitNoteDetail> notDebDetallesList;
    @JoinColumn(name = "remitente", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private User sender;    
}
