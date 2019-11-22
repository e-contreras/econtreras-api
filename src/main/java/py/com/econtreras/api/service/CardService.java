package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.CardBean;

public interface CardService {
    public List<CardBean> findByClient(Integer clientId) throws Exception;
    public CardBean save(CardBean request) throws Exception;
    public CardBean update(CardBean request) throws Exception;
    public void delete(Integer cardId) throws Exception;    
    
}
