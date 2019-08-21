package py.com.econtreras.api.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import py.com.econtreras.api.entity.Department;

public interface DepartmentRepository extends CrudRepository<Department, Integer> {

	@Query(value = "SELECT d FROM Department d WHERE d.departamentName = :departamentName")
	public Department findByDepartamentName(@Param("departamentName") String departamentName);
	
}
