package py.com.econtreras.api.controller;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.CardBean;
import py.com.econtreras.api.service.CardService;

@CrossOrigin("*")
@RestController
@RequestMapping("/card")
public class CardController {
    
    @Autowired
    private CardService cardService;
    
    @GetMapping(value="/{clientId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> findByClient(@PathVariable("clientId") Integer clientId){
        try {
            List<CardBean> cards = cardService.findByClient(clientId);
            if(cards == null || cards.isEmpty()){
                return new ResponseEntity(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity(cards, HttpStatus.OK);
        } catch (Exception ex) {
            Logger.getLogger(CardController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping(consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> save(@RequestBody CardBean cardBean){
        try {
            CardBean card = cardService.save(cardBean);
            return new ResponseEntity(card, HttpStatus.CREATED);
        } catch (Exception ex) {
            Logger.getLogger(CardController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @DeleteMapping(value="/{cardId}")
    public ResponseEntity<?> delete(@PathVariable("cardId") Integer cardId){
        try{
            cardService.delete(cardId);
            return new ResponseEntity(HttpStatus.OK);            
        } catch (Exception ex) {
            Logger.getLogger(CardController.class.getName()).log(Level.SEVERE, null, ex);
            return new ResponseEntity(ex, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
}
