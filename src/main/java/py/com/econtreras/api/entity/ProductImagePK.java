
package py.com.econtreras.api.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class ProductImagePK implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "mercaderia", nullable = false)
    private int product;
    @Basic(optional = false)
    @Column(name = "imagenes", nullable = false)
    private int image;
    
}
