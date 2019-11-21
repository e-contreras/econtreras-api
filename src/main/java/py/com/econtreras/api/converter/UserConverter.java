package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.RegisterRequest;
import py.com.econtreras.api.beans.UserBean;
import py.com.econtreras.entity.DocumentType;
import py.com.econtreras.entity.Person;
import py.com.econtreras.entity.PersonType;
import py.com.econtreras.entity.Role;
import py.com.econtreras.entity.User;

@Component
public class UserConverter {
    
    public UserBean buildBean(User entity) {
        UserBean bean = new UserBean();
        bean.setId(entity.getId());
        bean.setUsername(entity.getUsername());
        bean.setRol(entity.getRole() != null ? entity.getRole().getDescription() : null);
        bean.setName(entity.getPerson() != null ? entity.getPerson().getName() : null);
        bean.setLastName(entity.getPerson() != null ? entity.getPerson().getLastname() : null);
        return bean;
    }    
    
    public User buildEntity(UserBean bean){
        User entity = new User();
        entity.setUsername(bean.getUsername());
        entity.setPassword(bean.getPassword());
        // falta modificar el bean para el id del rol
        return entity;
    }
    
    public User buildEntity(RegisterRequest bean){
        
        User entity = new User();
        
        PersonType personType = new PersonType();
        personType.setId(bean.getPersonType());

        DocumentType documentType = new DocumentType();
        documentType.setId(bean.getDocumentType());
        
        Role role = new Role();
        role.setId(bean.getRoleId());
        
        Person person = new Person();
        person.setBirthday(bean.getBirthday());
        person.setName(bean.getName());
        person.setLastname(bean.getLastName());
        person.setEmail(bean.getEmail()); 
        person.setCellphone(bean.getCellphone());
        person.setPhone(bean.getPhone());        
        person.setPersonType(personType);
        person.setDocumentNumber(bean.getDocumentNumber());
        person.setDocumentType(documentType);        

        entity.setUsername(bean.getUsername());
        entity.setPassword(bean.getPassword());
        entity.setActive((short)1);
        entity.setPerson(person);
        entity.setRole(role);
        entity.setLoginFailed(1);
        
        return entity;
        
    }    
    
}
