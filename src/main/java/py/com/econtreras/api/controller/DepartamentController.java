package py.com.econtreras.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import py.com.econtreras.api.beans.Departament;
import py.com.econtreras.api.service.DepartamentService;

@RestController
@RequestMapping("/departaments")
public class DepartamentController {

	@Autowired
	private DepartamentService service;

	@GetMapping(produces = "application/json")
	public ResponseEntity<Iterable<Departament>> getAll() {
		Iterable<Departament> iBeans = service.findAll();
		if (iBeans.iterator().hasNext())
			return new ResponseEntity<>(iBeans, HttpStatus.OK);
		else
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

}