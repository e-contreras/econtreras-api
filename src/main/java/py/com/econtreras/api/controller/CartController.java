package py.com.econtreras.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import py.com.econtreras.api.beans.CartBean;
import py.com.econtreras.api.beans.CartProductBean;
import py.com.econtreras.api.beans.ProductBean;
import py.com.econtreras.api.beans.ProductResponse;
import py.com.econtreras.api.converter.ProductConverter;
import py.com.econtreras.api.repository.ProductRepository;
import py.com.econtreras.api.repository.ProductSolicitudeRepository;
import py.com.econtreras.api.repository.SolicitudeRepository;
import py.com.econtreras.api.repository.SolicitudeStatusRepository;
import py.com.econtreras.api.service.ProductService;
import py.com.econtreras.entity.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/carts")
public class CartController {

    @Autowired
    private ProductSolicitudeRepository productSolicitudeRepository;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductConverter productConverter;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private SolicitudeRepository solicitudeRepository;
    @Autowired
    private SolicitudeStatusRepository solicitudeStatusRepository;


    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<CartBean> addCart(@RequestBody CartBean cartBean){


        if(cartBean != null && cartBean.getCartProductBeanList() != null && !cartBean.getCartProductBeanList().isEmpty()) {
            Solicitude solicitude = new Solicitude();
            if(cartBean.getSolicitudeId() != null && cartBean.getSolicitudeId() > 0){
                Optional<Solicitude> optionalSolicitude =solicitudeRepository.findById(cartBean.getSolicitudeId());
                solicitude = optionalSolicitude.isPresent() ? optionalSolicitude.get() : new Solicitude();
            }

            Optional<SolicitudeStatus> solicitudeStatus = solicitudeStatusRepository.findSolicitudeStatusBy(cartBean.getStatus());
            if(!solicitudeStatus.isPresent()){
                solicitudeStatus = solicitudeStatusRepository.findSolicitudeStatusBy("creado");
            }

            solicitude.setStatus(solicitudeStatus.get());
            solicitude.setCreationDate(solicitude.getConfirmationDate() != null ? solicitude.getConfirmationDate() : new Date());
            solicitude = solicitudeRepository.save(solicitude);

            List<ProductSolicitude> products = new ArrayList<>();
            for (CartProductBean bean : cartBean.getCartProductBeanList()) {
                Optional<Product> optionalProduct = productRepository.findById(bean.getProductId());
                if (optionalProduct.isPresent()) {

                    Product p = optionalProduct.get();
                    ProductSolicitudePK pk = new ProductSolicitudePK();
                    pk.setProductId(p.getId());
                    pk.setSolicitudeId(solicitude.getId());
                    Optional<ProductSolicitude> optionalProductSolicitude = productSolicitudeRepository.findById(pk);
                    ProductSolicitude productSolicitude = optionalProductSolicitude.isPresent() ? optionalProductSolicitude.get() : new ProductSolicitude(pk);
                    productSolicitude.setQuantity(bean.getQuantity());
                    productSolicitude.setPrice(bean.getPrice());
                    products.add(productSolicitude);

                }
            }

            solicitude.setProdcutSolicitudeList(products);
            solicitude = solicitudeRepository.save(solicitude);


            cartBean.setStatus("Ceado");
            cartBean.setSolicitudeId(solicitude.getId());
            return  new ResponseEntity<>(cartBean, HttpStatus.OK);

        }

        return  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
