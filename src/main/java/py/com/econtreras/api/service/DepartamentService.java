package py.com.econtreras.api.service;

import py.com.econtreras.api.beans.Departament;

public interface DepartamentService {

	Departament findById(Integer id);
	
	Iterable<Departament> findAll();
	
	Departament save(Departament departament);
	
}