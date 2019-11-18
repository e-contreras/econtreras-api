package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import py.com.econtreras.entity.Vehicle;

@Component
public class VehicleConverter {

    public Vehicle buildEntity(py.com.econtreras.api.beans.Vehicle bean) {
        Vehicle entity = new Vehicle();
        entity.setId(bean.getId());
        entity.setBrand(bean.getBrand());
        entity.setModel(bean.getModel());
        entity.setColor(bean.getColor());
        entity.setYear(bean.getYear());
        entity.setDocumentNumber(bean.getDocumentNumber());
        entity.setCapacity(bean.getCapacity());
        entity.setChassis(bean.getChassis());
        entity.setPlate(bean.getPlate());
        return entity;
    }

    public py.com.econtreras.api.beans.Vehicle buildBean(Vehicle entity) {
        py.com.econtreras.api.beans.Vehicle bean = new py.com.econtreras.api.beans.Vehicle();
        bean.setId(entity.getId());
        bean.setBrand(entity.getBrand());
        bean.setModel(entity.getModel());
        bean.setYear(entity.getYear());
        bean.setDocumentNumber(entity.getDocumentNumber());
        bean.setCapacity(entity.getCapacity());
        bean.setChassis(entity.getChassis());
        bean.setPlate(entity.getPlate());
        return bean;
    }
}
