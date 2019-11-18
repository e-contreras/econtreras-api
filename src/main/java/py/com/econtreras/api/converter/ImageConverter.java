//package py.com.econtreras.api.converter;
//
//import lombok.Data;
//import py.com.econtreras.api.beans.ImageRequest;
//import py.com.econtreras.entity.Image;
//
//@Data
//public class ImageConverter {
//
//	public Image buildEntity(ImageRequest bean) {
//		Image entity = new Image();
//		entity.setId(bean.getId());
//		entity.setOrder(bean.getOrder());
//		entity.setSrc(bean.getSrc());
//		return entity;
//	}
//
//	public ImageRequest buildBean(Image entity) {
//		ImageRequest bean = new ImageRequest();
//		bean.setId(entity.getId());
//		bean.setSrc(entity.getSrc());
//		return bean;
//	}
//
//
//}
