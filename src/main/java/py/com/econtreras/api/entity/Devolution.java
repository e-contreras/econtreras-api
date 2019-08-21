package py.com.econtreras.api.entity;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name = "devoluciones", catalog = "econtreras", schema = "")
public class Devolution implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fec_alta", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Basic(optional = false)
    @Lob
    @Column(name = "comentarios", nullable = false, length = 65535)
    private String comment;
    @Basic(optional = false)
    @Column(name = "concepto", nullable = false, length = 100)
    private String concept;
    @JoinColumn(name = "mercaderia", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Product product;

}
