package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import py.com.econtreras.api.beans.Departament;
import py.com.econtreras.api.converter.DepartamentConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.DepartamentRepository;
import py.com.econtreras.api.service.DepartamentService;

@Service
public class DepartamentServiceImpl implements DepartamentService {

	@Autowired
	private ApiMessage message;
	@Autowired
	private DepartamentConverter converter;
	@Autowired
	private DepartamentRepository repository;
	private static final Logger LOGGER = LogManager.getLogger(DepartamentServiceImpl.class);

	@Override
	public Departament findById(Integer id) {
		try {
			Optional<py.com.econtreras.api.entity.Departament> optionalEntity = repository.findById(id);
			if (optionalEntity.isPresent()) {
				throw new APIException(HttpStatus.NO_CONTENT);
			}
			return converter.buildBean(optionalEntity.get());
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
		}
	}

	@Override
	public Iterable<Departament> findAll() {
		try {

			Iterable<py.com.econtreras.api.entity.Departament> iEntity = repository.findAll();
			List<Departament> departamentList = new ArrayList<>();

			for (py.com.econtreras.api.entity.Departament departament : iEntity) {
				departamentList.add(converter.buildBean(departament));
			}
			return departamentList;

		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
		}
	}

	@Override
	public Departament save(Departament departament) {
		try {
			if (departament.getId() == null
					&& repository.findByDepartamentName(departament.getDepartamentName()) != null) {
				throw new APIException(HttpStatus.UNPROCESSABLE_ENTITY, message.getAlreadyExistMessage());
			}

			py.com.econtreras.api.entity.Departament entity = repository.save(converter.buildEntity(departament));

			return converter.buildBean(entity);
		} catch (APIException e) {
			throw e;
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
		}

	}

}
