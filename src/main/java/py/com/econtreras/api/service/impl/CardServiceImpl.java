package py.com.econtreras.api.service.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.CardBean;
import py.com.econtreras.api.converter.CardConverter;
import py.com.econtreras.api.repository.CardRepository;
import py.com.econtreras.api.repository.UserRepository;
import py.com.econtreras.api.service.CardService;
import py.com.econtreras.entity.Tarjetas;
import py.com.econtreras.entity.User;

@Service
public class CardServiceImpl implements CardService{

    @Autowired
    private CardRepository cardRepository;
    
    @Autowired
    private CardConverter cardConverter;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<CardBean> findByClient(Integer clientId) throws Exception {
        return cardConverter.buildBeans(cardRepository.findByClientId(clientId));
    }
    
    public CardBean findById(Integer id) throws Exception {
        return cardConverter.buildBean(cardRepository.findById(id).get());
    }

    @Transactional
    @Override
    public CardBean save(CardBean request) throws Exception {
        Optional<User> client = userRepository.findById(request.getClienteId());
        if(!client.isPresent()){ throw new Exception("El cliente no existe"); }
        Tarjetas entity = cardConverter.buildEntity(request);
        entity.setCliente(client.get());
        Tarjetas saved = cardRepository.save(entity);
        if(saved != null){ return this.findById(saved.getId()); }
        throw new Exception("Ha ocurrido un error al guardar la tarjeta");
    }
    
    @Transactional
    @Override
    public CardBean update(CardBean request) throws Exception {
        Tarjetas card = cardRepository.findById(request.getId()).get();
        if(card == null){ throw new Exception("La tarjeta no existe"); }
        return cardConverter.buildBean(cardRepository.save(card));
    }    

    
    @Override
    public void delete(Integer cardId) throws Exception {
        Tarjetas card = cardRepository.findById(cardId).get();
        if(card != null){ cardRepository.delete(card); return; }
        throw new Exception("La tarjeta no existe");
    }

}
