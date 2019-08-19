package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;

import py.com.econtreras.api.entity.Departament;

@Component
public class DepartamentConverter {
	
	public Departament buildEntity(py.com.econtreras.api.beans.Departament bean) {
		Departament entity = new Departament();
		entity.setId(bean.getId());
		entity.setDepartamentName(bean.getDepartamentName());
		return entity;
	}
	
	public py.com.econtreras.api.beans.Departament buildBean(Departament entity){
		py.com.econtreras.api.beans.Departament bean = new py.com.econtreras.api.beans.Departament();
		bean.setId(entity.getId());
		bean.setDepartamentName(entity.getDepartamentName());
		return bean;
	}

}
