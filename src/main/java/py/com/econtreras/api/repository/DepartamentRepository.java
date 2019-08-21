package py.com.econtreras.api.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import py.com.econtreras.api.entity.Departament;

public interface DepartamentRepository extends CrudRepository<Departament, Integer> {

	@Query(value = "SELECT d FROM Departament d WHERE d.departamentName = :departamentName")
	public Departament findByDepartamentName(@Param("departamentName") String departamentName);
	
}
