package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.entity.Address;
import py.com.econtreras.api.repository.NeighborhoodRepository;
import py.com.econtreras.api.repository.PersonRepository;

@Component
public class AddressConverter {

    @Autowired
    NeighborhoodRepository neighborhoodRepository;

    @Autowired
    PersonRepository personRepository;

    public Address buildEntity(py.com.econtreras.api.beans.AddressRequest bean) {
        Address entity = new Address();
        entity.setId(bean.getId());
        entity.setPrincipalStreet(bean.getPrincipalStreet());
        entity.setSecondaryStreet(bean.getSecondaryStreet());
        entity.setNumber(bean.getNumber());
        entity.setBuilding(bean.getBuilding());
        entity.setFloor(bean.getFloor());
        entity.setApartment(bean.getApartment());
        entity.setAddressType(bean.getAddressType());
        entity.setNeighborhood(neighborhoodRepository.findById(bean.getNeighborhoodId()).get());
        entity.setPerson(personRepository.findById(bean.getPersonId()).get());
        return entity;
    }

    public py.com.econtreras.api.beans.AddressResponse buildBean(Address entity) {
        py.com.econtreras.api.beans.AddressResponse bean = new py.com.econtreras.api.beans.AddressResponse();
        bean.setAddressId(entity.getId());
        bean.setPrincipalStreet(entity.getPrincipalStreet());
        bean.setSecondaryStreet(entity.getSecondaryStreet());
        bean.setNumber(entity.getNumber());
        bean.setBuilding(entity.getBuilding());
        bean.setFloor(entity.getFloor());
        bean.setApartment(entity.getApartment());
        bean.setAddressType(entity.getAddressType());
        return bean;
    }
    
    public py.com.econtreras.api.beans.AddressResponse buildBean(Address entity, Link... links) {
        py.com.econtreras.api.beans.AddressResponse bean = new py.com.econtreras.api.beans.AddressResponse();
        bean.setAddressId(entity.getId());
        bean.setPrincipalStreet(entity.getPrincipalStreet());
        bean.setSecondaryStreet(entity.getSecondaryStreet());
        bean.setNumber(entity.getNumber());
        bean.setBuilding(entity.getBuilding());
        bean.setFloor(entity.getFloor());
        bean.setApartment(entity.getApartment());
        bean.setAddressType(entity.getAddressType());
        bean.add(links);
        return bean;
    }
}
