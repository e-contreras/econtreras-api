package py.com.econtreras.api.service;


import py.com.econtreras.api.beans.BugetSolicitudeResponse;

import java.util.List;


public interface BugetSolicitudeService {

    BugetSolicitudeResponse findById(Integer id);
    List<BugetSolicitudeResponse> findAll();
    BugetSolicitudeResponse save(BugetSolicitudeResponse response);


}
