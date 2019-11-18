package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.Department;
import py.com.econtreras.api.converter.DepartmentConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.DepartmentRepository;
import py.com.econtreras.api.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private ApiMessage message;
    @Autowired
    private DepartmentConverter converter;
    @Autowired
    private DepartmentRepository repository;
    private static final Logger LOGGER = LogManager.getLogger(DepartmentServiceImpl.class);

    @Override
    public Department findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.Department> optionalEntity = repository.findById(id);
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }
            return converter.buildBean(optionalEntity.get());
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<Department> findAll() {
        try {
            Iterable<py.com.econtreras.entity.Department> iEntity = repository.findAll();
            List<Department> departamentList = new ArrayList<>();

            for (py.com.econtreras.entity.Department department : iEntity) {
                departamentList.add(converter.buildBean(department));
            }
            return departamentList;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Department save(Department department) {
        try {
            if (department.getId() == null
                    && repository.findByDepartamentName(department.getDepartmentName()) != null) {
                throw new APIException(HttpStatus.UNPROCESSABLE_ENTITY, message.getAlreadyExistMessage());
            }

            py.com.econtreras.entity.Department entity = repository.save(converter.buildEntity(department));

            return converter.buildBean(entity);
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }

    }

    @Override
    public Department update(Department department) {
        try {
            Optional<py.com.econtreras.entity.Department> optionalEntity = repository.findById(department.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return converter.buildBean(repository.save(converter.buildEntity(department)));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
