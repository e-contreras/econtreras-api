package py.com.econtreras.api.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.BugetSolicitudeResponse;
import py.com.econtreras.api.repository.BugetSolicitudeRepository;
import py.com.econtreras.api.repository.BugetSolicitudeStatusRepository;
import py.com.econtreras.api.repository.CategoryRepository;
import py.com.econtreras.entity.BudgetSolicitudeStatus;
import py.com.econtreras.entity.BugetSolicitude;
import py.com.econtreras.entity.Category;

import java.util.Optional;

@Component
public class BugetSolicitudeConverter {

    @Autowired
    private BugetSolicitudeStatusRepository bugetSolicitudeStatusRepository;
    @Autowired
    private CategoryRepository categoryRepository;

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

    public BugetSolicitude build(BugetSolicitudeResponse response){
        BugetSolicitude entity = new BugetSolicitude();
        entity.setId(response.getId());
        entity.setCategory(getCategory(response.getCategory()));
        entity.setDescription(response.getDescription());
        entity.setId(response.getId());
        entity.setInitDate(response.getInitDate());
        entity.setEndDate(response.getEndDate());
        entity.setStatus(response.getStatus());
        return entity;
    }

    private BudgetSolicitudeStatus getStatus(String statusName){
        Optional<BudgetSolicitudeStatus> statusOptional = bugetSolicitudeStatusRepository.findByStatus(statusName);
        if(!statusOptional.isPresent())
            return null;
        else
            return statusOptional.get();
    }

    private Category getCategory(String categoryName){
        Optional<Category> optionalCategory = categoryRepository.findByDescription(categoryName);
        if(!optionalCategory.isPresent())
            return null;
        else
            return optionalCategory.get();
    }

}
