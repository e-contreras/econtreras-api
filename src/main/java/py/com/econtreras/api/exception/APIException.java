package py.com.econtreras.api.exception;

public class APIException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public APIException(Throwable exception) {
		super(exception);
	}
	
}
