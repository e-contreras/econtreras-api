package py.com.econtreras.api.converter;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.CardBean;
import py.com.econtreras.entity.Tarjetas;
import py.com.econtreras.entity.User;

@Component
public class CardConverter {

    public Tarjetas buildEntity(CardBean bean) {
        if(bean == null){ return null; }        
        Tarjetas entity = new Tarjetas();
        entity.setId(bean.getId());
        entity.setFechaExpiracionAnho(bean.getFechaExpiracionAnho());
        entity.setFechaExpiracionMes(bean.getFechaExpiracionMes());
        entity.setNombre(bean.getNombre());
        entity.setNumero(bean.getNumero());
        User client = new User();
        client.setId(bean.getClienteId());
        entity.setCliente(client);
        return entity;
    }
    
    public List<CardBean> buildBeans(List<Tarjetas> entities){
        List<CardBean> beans = new ArrayList<>();
        if(entities == null || entities.isEmpty()){ return beans; }
        for(Tarjetas entity : entities){ beans.add(this.buildBean(entity)); }
        return beans;
    }

    public CardBean buildBean(Tarjetas entity) {
        if(entity == null){ return null; }
        CardBean bean = new CardBean();
        bean.setId(entity.getId());
        bean.setClienteId(entity.getCliente().getId());
        bean.setFechaExpiracionAnho(entity.getFechaExpiracionAnho());
        bean.setFechaExpiracionMes(entity.getFechaExpiracionMes());
        bean.setNombre(entity.getNombre());
        bean.setNumero(entity.getNumero());
        return bean;
    }
}
