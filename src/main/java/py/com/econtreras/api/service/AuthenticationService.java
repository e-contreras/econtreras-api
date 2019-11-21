package py.com.econtreras.api.service;

import py.com.econtreras.api.beans.RegisterRequest;
import py.com.econtreras.api.beans.UserBean;

public interface AuthenticationService {
    public UserBean login(UserBean request) throws Exception;
    public UserBean register(RegisterRequest request) throws Exception;
}
