package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Role;

@Component
public class RoleConverter {

    public Role buildEntity(py.com.econtreras.api.beans.RoleRequest bean) {
        Role entity = new Role();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        return entity;
    }

    public py.com.econtreras.api.beans.RoleResponse buildBean(Role entity) {
        py.com.econtreras.api.beans.RoleResponse bean = new py.com.econtreras.api.beans.RoleResponse();
        bean.setRoleId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }
}
