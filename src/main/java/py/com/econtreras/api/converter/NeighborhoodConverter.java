package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.entity.Neighborhood;
import py.com.econtreras.api.repository.CityRepository;

@Component
public class NeighborhoodConverter {

    @Autowired
    CityRepository cityRepository;

    public Neighborhood buildEntity(py.com.econtreras.api.beans.NeighborhoodRequest bean) {
        Neighborhood entity = new Neighborhood();
        entity.setId(bean.getId());
        entity.setDescription(bean.getDescription());
        entity.setCity(cityRepository.findById(bean.getCityId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.NeighborhoodResponse buildBean(Neighborhood entity) {
        py.com.econtreras.api.beans.NeighborhoodResponse bean = new py.com.econtreras.api.beans.NeighborhoodResponse();
        bean.setNeighborhoodId(entity.getId());
        bean.setDescription(entity.getDescription());
        return bean;
    }
    
    public py.com.econtreras.api.beans.NeighborhoodResponse buildBean(Neighborhood entity, Link... links) {
        py.com.econtreras.api.beans.NeighborhoodResponse bean = new py.com.econtreras.api.beans.NeighborhoodResponse();
        bean.setNeighborhoodId(entity.getId());
        bean.setDescription(entity.getDescription());
        bean.add(links);
        return bean;
    }
}
