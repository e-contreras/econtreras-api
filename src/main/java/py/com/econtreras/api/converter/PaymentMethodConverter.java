package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.PaymentMethod;

@Component
public class PaymentMethodConverter {

    public PaymentMethod buildEntity(py.com.econtreras.api.beans.PaymentMethod bean) {
        PaymentMethod entity = new PaymentMethod();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.PaymentMethod buildBean(PaymentMethod entity) {
        py.com.econtreras.api.beans.PaymentMethod bean = new py.com.econtreras.api.beans.PaymentMethod();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }
}
