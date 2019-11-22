package py.com.econtreras.api.converter;

import java.util.Date;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.ImageRequest;
import py.com.econtreras.entity.Image;

@Component
public class ImageConverter {

    public Image buildEntity(ImageRequest bean) {
        Image entity = new Image();
        entity.setId(bean.getId());
        entity.setOrder(bean.getOrder());
        entity.setSrc(bean.getSrc());
        entity.setCreationDate(bean.getId() == null ? new Date() : null);
        return entity;
    }

    public ImageRequest buildBean(Image entity) {
        ImageRequest bean = new ImageRequest();
        bean.setId(entity.getId());
        bean.setSrc(entity.getSrc());
        return bean;
    }
}
