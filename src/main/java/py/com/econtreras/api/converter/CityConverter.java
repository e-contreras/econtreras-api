package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.entity.City;
import py.com.econtreras.api.repository.DepartmentRepository;

@Component
public class CityConverter {

    @Autowired
    DepartmentRepository departmentRepository;

    public City buildEntity(py.com.econtreras.api.beans.CityRequest bean) {
        City entity = new City();
        entity.setId(bean.getId());
        entity.setCityName(bean.getCityName());
        entity.setDepartament(departmentRepository.findById(bean.getDepartmentId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.CityResponse buildBean(City entity) {
        py.com.econtreras.api.beans.CityResponse bean = new py.com.econtreras.api.beans.CityResponse();
        bean.setCityId(entity.getId());
        bean.setCityName(entity.getCityName());
        return bean;
    }
    
    public py.com.econtreras.api.beans.CityResponse buildBean(City entity, Link... links) {
        py.com.econtreras.api.beans.CityResponse bean = new py.com.econtreras.api.beans.CityResponse();
        bean.setCityId(entity.getId());
        bean.setCityName(entity.getCityName());
        bean.add(links);
        return bean;
    }
}
