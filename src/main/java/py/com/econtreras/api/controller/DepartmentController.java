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
import org.springframework.web.bind.annotation.RestController;

import py.com.econtreras.api.beans.Department;
import py.com.econtreras.api.service.DepartmentService;

@RestController
@RequestMapping("/departments")
public class DepartmentController {

	@Autowired
	private DepartmentService service;

	@GetMapping(value="/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Department> getById(@PathVariable("id") Integer id) {
		return new ResponseEntity<>(service.findById(id), HttpStatus.OK);
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Department>> getAll() {
		Iterable<Department> iBeans = service.findAll();
		if (iBeans.iterator().hasNext())
			return new ResponseEntity<>(iBeans, HttpStatus.OK);
		else
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Department> save(@Valid @RequestBody Department departament) {
		if (departament.getId() != null) {
			return new ResponseEntity<Department>(service.save(departament), HttpStatus.OK);
		} else {
			return new ResponseEntity<Department>(service.save(departament), HttpStatus.CREATED);
		}
	}

}