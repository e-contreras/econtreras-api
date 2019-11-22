package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Image;

public interface ImageRepository extends CrudRepository<Image, Integer> {

}
