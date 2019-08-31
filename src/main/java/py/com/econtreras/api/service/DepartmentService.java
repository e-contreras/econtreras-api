package py.com.econtreras.api.service;

import py.com.econtreras.api.beans.Department;

public interface DepartmentService {

    Department findById(Integer id);

    Iterable<Department> findAll();

    Department save(Department departament);

    Department update(Integer id, Department departament);

}
