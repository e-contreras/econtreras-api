package py.com.econtreras.api.converter;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.BugetSolicitudeResponse;
import py.com.econtreras.entity.BugetSolicitude;

@Component
public class BugetSolicitudeConverter {

    @Transactional
    public BugetSolicitudeResponse build(BugetSolicitude solicitude){
        BugetSolicitudeResponse response = new BugetSolicitudeResponse();
        response.setCategory(solicitude.getCategory() != null ?solicitude.getCategory().getDescription() : null);
        response.setDescription(solicitude.getDescription());
        response.setId(solicitude.getId());
        response.setInitDate(solicitude.getInitDate());
        response.setEndDate(solicitude.getEndDate());
        response.setStatus(solicitude.getBudgetSolicitudeStatus() != null ? solicitude.getBudgetSolicitudeStatus().getStatus() : null );
        return response;
    }


}
