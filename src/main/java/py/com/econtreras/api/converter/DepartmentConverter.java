package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;

import py.com.econtreras.api.entity.Department;

@Component
public class DepartmentConverter {

    public Department buildEntity(py.com.econtreras.api.beans.Department bean) {
        Department entity = new Department();
        entity.setId(bean.getId());
        entity.setDepartamentName(bean.getDepartmentName());
        return entity;
    }

    public py.com.econtreras.api.beans.Department buildBean(Department entity) {
        py.com.econtreras.api.beans.Department bean = new py.com.econtreras.api.beans.Department();
        bean.setId(entity.getId());
        bean.setDepartmentName(entity.getDepartamentName());
        return bean;
    }

}
