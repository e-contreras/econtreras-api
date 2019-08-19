package py.com.econtreras.api.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import py.com.econtreras.api.exception.APIException;

@ControllerAdvice
@RestController
public class APIResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {
	private static final Logger LOGGER = LogManager.getLogger(APIResponseEntityExceptionHandler.class);
	
	@ExceptionHandler({APIException.class})
	public ResponseEntity<Object> apiExceptionHandler(APIException ex){
		LOGGER.error(ex);
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
