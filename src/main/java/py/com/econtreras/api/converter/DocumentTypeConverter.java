package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;

import py.com.econtreras.entity.DocumentType;

@Component
public class DocumentTypeConverter {

    public DocumentType buildEntity(py.com.econtreras.api.beans.DocumentType bean) {
        DocumentType entity = new DocumentType();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.DocumentType buildBean(DocumentType entity) {
        py.com.econtreras.api.beans.DocumentType bean = new py.com.econtreras.api.beans.DocumentType();
        bean.setId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }

}
