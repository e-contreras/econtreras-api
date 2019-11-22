package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.SolicitudeResponse;

public interface SolicitudeService {
    public List<SolicitudeResponse> findByClientId(Integer id) throws Exception;
}