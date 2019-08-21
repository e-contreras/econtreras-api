package py.com.econtreras.api.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import py.com.econtreras.api.beans.Departament;
import py.com.econtreras.api.service.DepartamentService;

@RestController
@RequestMapping("/departaments")
public class DepartamentController {

	@Autowired
	private DepartamentService service;

	@RequestMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE, method= RequestMethod.GET)
	public ResponseEntity<Departament> getById(@PathVariable("id") Integer id) {
		return new ResponseEntity<>(service.findById(id), HttpStatus.OK);
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Departament>> getAll() {
		Iterable<Departament> iBeans = service.findAll();
		if (iBeans.iterator().hasNext())
			return new ResponseEntity<>(iBeans, HttpStatus.OK);
		else
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Departament> save(@Valid @RequestBody Departament departament) {
		if (departament.getId() != null) {
			return new ResponseEntity<Departament>(service.save(departament), HttpStatus.OK);
		} else {
			return new ResponseEntity<Departament>(service.save(departament), HttpStatus.CREATED);
		}
	}

}