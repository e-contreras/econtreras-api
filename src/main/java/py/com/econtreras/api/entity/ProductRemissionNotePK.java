
package py.com.econtreras.api.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class ProductRemissionNotePK implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "pro_not_remision", nullable = false)
    private int providerRemissionNoteId;
    @Basic(optional = false)
    @Column(name = "mercaderia", nullable = false)
    private int productId;
}
