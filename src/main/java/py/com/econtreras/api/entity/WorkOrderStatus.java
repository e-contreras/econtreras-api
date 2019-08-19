
package py.com.econtreras.api.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "ord_tra_estados", catalog = "econtreras", schema = "")
public class WorkOrderStatus implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "description", nullable = false, length = 45)
    private String descripcion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "status")
    private List<WorkOrder> workOrderList;
}
