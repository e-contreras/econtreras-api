package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.UserBean;

public interface DriverService {
    public List<UserBean> findAll();
}
