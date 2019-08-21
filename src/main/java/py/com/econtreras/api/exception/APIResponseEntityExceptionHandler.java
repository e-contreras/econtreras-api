package py.com.econtreras.api.exception;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import lombok.AllArgsConstructor;
import lombok.Data;

@ControllerAdvice
@RestController
public class APIResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {
	private static final Logger LOGGER = LogManager.getLogger(APIResponseEntityExceptionHandler.class);
	
	@ExceptionHandler({APIException.class})
	public ResponseEntity<Object> apiExceptionHandler(APIException ex){
		LOGGER.error(ex);
		if(ex.getMessages() != null && ex.getMessages().length > 0)
			return new ResponseEntity<>(new MessagesError(ex.getMessages()), ex.getHttpStatus());
		return new ResponseEntity<>(ex.getHttpStatus());
	}
	
}

@Data
@AllArgsConstructor
class MessagesError{
	private String messages[];
	
}
