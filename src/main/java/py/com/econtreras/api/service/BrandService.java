package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.Brand;

public interface BrandService {

    Brand findById(Integer id);

    List<Brand> findAll();

    Brand save(Brand brand);

    Brand update(Integer id, Brand brand);

    Boolean delete(Integer id);
}
