package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.RingingBean;
import py.com.econtreras.entity.Ringing;

@Component
public class RingingConverter {
    
    public RingingBean buildBean(Ringing entity) {
        RingingBean bean = new RingingBean();
        bean.setId(entity.getId());
        bean.setDocumentType(entity.getDocumentType());
        bean.setRinging(entity.getRinging());
        bean.setValidityDate(entity.getValidityDate());
        return bean;
    }    
    
}
