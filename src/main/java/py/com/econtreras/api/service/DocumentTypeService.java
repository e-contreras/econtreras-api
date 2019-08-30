package py.com.econtreras.api.service;

import java.util.List;

import py.com.econtreras.api.beans.DocumentType;

public interface DocumentTypeService {

    DocumentType findById(Integer id);

    List<DocumentType> findAll();

    DocumentType save(DocumentType documentType);

    Boolean delete(Integer id);
}
