package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.basic.BasicTreeUI.TreeHomeAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import py.com.econtreras.api.beans.Departament;
import py.com.econtreras.api.converter.DepartamentConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.repository.DepartamentRepository;
import py.com.econtreras.api.service.DepartamentService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@Service
public class DepartamentServiceImpl implements DepartamentService {

	@Autowired
	private DepartamentConverter converter;
	@Autowired
	private DepartamentRepository repository;
	private static final Logger LOGGER = LogManager.getLogger(DepartamentServiceImpl.class);
	
	@Override
	public Iterable<Departament> findAll() {
		LOGGER.debug("Inicio del servicio departament");
		try {
			Iterable<py.com.econtreras.api.entity.Departament> iEntity = repository.findAll();
			List<Departament> departamentList = new ArrayList<>();
			for (py.com.econtreras.api.entity.Departament departament : iEntity) {
				departamentList.add(converter.buildBean(departament));
			}
			LOGGER.debug("Fin del servicio departament");
			return departamentList;

		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			throw new APIException(e);
		}
	}
}
