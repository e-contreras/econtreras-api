
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "depositos", catalog = "econtreras", schema = "")
public class Warehouse implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "descripcion", nullable = false, length = 45)
    private String description;
    @Basic(optional = false)
    @Column(name = "direccion", nullable = false, length = 45)
    private String address;
    @Basic(optional = false)
    @Column(name = "borrado", nullable = false)
    private short erased;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "warehouse")
    private List<Inventory> inventoryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "origin")
    private List<Transfer> originTransferList;
    @OneToMany(mappedBy = "destiny")
    private List<Transfer> destinyTransferList;

}
