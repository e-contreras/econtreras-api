package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.SolicitudeResponse;
import py.com.econtreras.api.converter.SolicitudeConverter;
import py.com.econtreras.api.converter.UserConverter;
import py.com.econtreras.api.repository.SolicitudeRepository;
import py.com.econtreras.api.repository.UserRepository;
import py.com.econtreras.api.service.SolicitudeService;
import py.com.econtreras.entity.Solicitude;
import py.com.econtreras.entity.User;

@Service
public class SolicitudeServiceImpl implements SolicitudeService{

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private UserConverter userConverter;
    
    @Autowired
    private SolicitudeRepository solicitudeRepository;
    
    @Autowired
    private SolicitudeConverter solicitudeConverter;

    @Override
    public List<SolicitudeResponse> findByClientId(Integer id) throws Exception {
        User user = userRepository.findById(id).get();
        if(user == null){ throw new Exception("El usuario no existe"); }
        List<Solicitude> solicitudes = solicitudeRepository.findByClientId(id);
        if(solicitudes == null || solicitudes.isEmpty()) { return new ArrayList<>(); }
        return solicitudeConverter.entitiesToModels(solicitudes);
    }
    
}
