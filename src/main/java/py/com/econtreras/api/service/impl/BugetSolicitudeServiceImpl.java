package py.com.econtreras.api.service.impl;

import org.apache.commons.collections4.IterableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.BugetSolicitudeResponse;
import py.com.econtreras.api.converter.BugetSolicitudeConverter;
import py.com.econtreras.api.repository.BugetSolicitudeRepository;
import py.com.econtreras.api.service.BugetSolicitudeService;
import py.com.econtreras.entity.BugetSolicitude;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BugetSolicitudeServiceImpl implements BugetSolicitudeService {

    @Autowired
    private BugetSolicitudeRepository bugetSolicitudeRepository;
    @Autowired
    private BugetSolicitudeConverter bugetSolicitudeConverter;

    @Transactional
    @Override
    public BugetSolicitudeResponse findById(Integer id) {
        Optional<BugetSolicitude> bugetSolicitudeOptional =  bugetSolicitudeRepository.findById(id);
        if(!bugetSolicitudeOptional.isPresent()){
            return null;
        }

        return bugetSolicitudeConverter.build(bugetSolicitudeOptional.get());
    }

    @Transactional
    @Override
    public List<BugetSolicitudeResponse> findAll() {
        List<BugetSolicitudeResponse> list = new ArrayList<>();
        Iterable<BugetSolicitude> iterable = bugetSolicitudeRepository.findAll();

        if(!IterableUtils.isEmpty(iterable)){
            List<BugetSolicitude>  bugetSolicitudes = IterableUtils.toList(iterable);
            for (BugetSolicitude bugetSolicitude : bugetSolicitudes) {
//                Hibernate.initialize(bugetSolicitude.getProductCategoryList());
                list.add(bugetSolicitudeConverter.build(bugetSolicitude));
            }
        }
        return list;
    }

    @Override
    public BugetSolicitudeResponse save(BugetSolicitudeResponse response) {
        return null;
    }
}
