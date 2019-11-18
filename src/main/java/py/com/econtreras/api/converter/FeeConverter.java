package py.com.econtreras.api.converter;

import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.entity.Fee;
import py.com.econtreras.api.repository.CategoryRepository;

@Component
public class FeeConverter {

    @Autowired
    CategoryRepository categoryRepository;

    public Fee buildEntity(py.com.econtreras.api.beans.FeeRequest bean) {
        Fee entity = new Fee();
        entity.setId(bean.getId());
        entity.setFeeNumber(bean.getFeeNumber());
        entity.setPonderator(new BigDecimal(bean.getPonderator()));
        entity.setPoductsId(bean.getProductsId());
        entity.setCategory(categoryRepository.findById(bean.getCategoryId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.FeeResponse buildBean(Fee entity) {
        py.com.econtreras.api.beans.FeeResponse bean = new py.com.econtreras.api.beans.FeeResponse();
        bean.setFeeId(entity.getId());
        bean.setProductsId(entity.getPoductsId());
        bean.setFeeNumber(entity.getFeeNumber());
        bean.setPonderator(entity.getPonderator().floatValue());
        return bean;
    }
    
    public py.com.econtreras.api.beans.FeeResponse buildBean(Fee entity, Link... links) {
        py.com.econtreras.api.beans.FeeResponse bean = new py.com.econtreras.api.beans.FeeResponse();
        bean.setFeeId(entity.getId());
        bean.setProductsId(entity.getPoductsId());
        bean.setFeeNumber(entity.getFeeNumber());
        bean.setPonderator(entity.getPonderator().floatValue());
        bean.add(links);
        return bean;
    }
}
