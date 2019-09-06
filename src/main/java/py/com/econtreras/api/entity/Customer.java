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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "clientes")
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "borrado", nullable = false)
    private short erased;
    @Column(name = "fec_alta")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecAlta;
    @Column(name = "fec_modificacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecModificacion;
    @Column(name = "fec_eliminacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecEliminacion;
    @JoinColumn(name = "persona", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Person person;

}
