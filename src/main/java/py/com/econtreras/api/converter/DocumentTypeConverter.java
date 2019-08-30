package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;

import py.com.econtreras.api.entity.DocumentType;

@Component
public class DocumentTypeConverter {

    public DocumentType buildEntity(py.com.econtreras.api.beans.DocumentType bean) {
        DocumentType entity = new DocumentType();
        entity.setDescription(bean.getDescription());
        entity.setId(bean.getId());
        return entity;
    }

    public py.com.econtreras.api.beans.DocumentType buildBean(DocumentType entity) {
        py.com.econtreras.api.beans.DocumentType bean = new py.com.econtreras.api.beans.DocumentType();
        bean.setDescription(entity.getDescription());
        bean.setId(entity.getId());
        return bean;
    }

}
