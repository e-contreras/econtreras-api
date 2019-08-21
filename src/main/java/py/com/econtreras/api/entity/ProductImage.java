
package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "mer_imagenes", catalog = "econtreras", schema = "")
public class ProductImage implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductImagePK merImagenesPK;
    @Basic(optional = false)
    @Column(name = "principal", nullable = false)
    private Character principal;
    @JoinColumn(name = "imagenes", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Image image;
    @JoinColumn(name = "mercaderia", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;
    
}
