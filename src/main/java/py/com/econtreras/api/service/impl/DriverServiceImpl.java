package py.com.econtreras.api.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.UserBean;
import py.com.econtreras.api.converter.UserConverter;
import py.com.econtreras.api.repository.UserRepository;
import py.com.econtreras.api.service.DriverService;
import py.com.econtreras.entity.User;

@Service
public class DriverServiceImpl implements DriverService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private UserConverter userConverter;
    
    @Override
    public List<UserBean> findAll() {
        return userConverter.buildBeans((List<User>)userRepository.findAll());
    }
    

}

