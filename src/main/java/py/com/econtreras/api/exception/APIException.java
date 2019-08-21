package py.com.econtreras.api.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.Setter;


public class APIException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Getter
	@Setter
	private HttpStatus httpStatus;
	@Setter
	@Getter
	private String[] messages;
	

	public APIException(HttpStatus httpStatus, String ...messages) {
		super();
		this.httpStatus = httpStatus;
		this.messages = messages;
	}


	public APIException(HttpStatus httpStatus) {
		super();
		this.httpStatus = httpStatus;
	}
		
}
