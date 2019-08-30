package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.PersonType;

public interface PersonTypeService {

    PersonType findById(Integer id);

    List<PersonType> findAll();

    PersonType save(PersonType personType);

    PersonType update(Integer id, PersonType personType);
    
    Boolean delete(Integer id);
}
