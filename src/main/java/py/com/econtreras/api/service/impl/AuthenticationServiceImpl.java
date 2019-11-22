package py.com.econtreras.api.service.impl;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.RegisterRequest;
import py.com.econtreras.api.beans.UserBean;
import py.com.econtreras.api.converter.UserConverter;
import py.com.econtreras.api.repository.PersonRepository;
import py.com.econtreras.api.repository.UserRepository;
import py.com.econtreras.api.service.AuthenticationService;
import py.com.econtreras.entity.User;

@Service
public class AuthenticationServiceImpl implements AuthenticationService{

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PersonRepository personRepository; 
    
    @Autowired
    private UserConverter userConverter;
    
    @Override
    public UserBean login(UserBean request) throws Exception {
        User user = userRepository.findByUsername(request.getUsername());
        if(user != null){
            if(user.getActive() == 0){
                throw new Exception("Su usuario está bloqueado");
            }
            if( BCrypt.checkpw(request.getPassword(), user.getPassword()) ){
                user.setLoginFailed(0);
                userRepository.save(user);
                return userConverter.buildBean(user);
            }
            else{
                if(user.getLoginFailed() < 3 ){
                    user.setLoginFailed(user.getLoginFailed()+1);
                    userRepository.save(user);
                    throw new Exception("Usuario o contraseña inválidos");                    
                }
                else {
                    user.setActive((short)0);
                    userRepository.save(user);
                    throw new Exception("Su usuario ha sido bloqueado");
                }                
            }
        }
        throw new Exception("Usuario o contraseña inválidos");
    }

    @Override
    public UserBean register(RegisterRequest request) throws Exception {
        User user = userConverter.buildEntity(request);
        try {
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            return userConverter.buildBean(userRepository.save(user)); 
        }
        catch(Exception ex){
            throw new Exception("Ha ocurrido un error al registrar al usuario");
        }
    }
    
}
