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
import py.com.econtreras.api.converter.ProductConverter;
import py.com.econtreras.api.repository.*;
import py.com.econtreras.api.service.InvoiceService;
import py.com.econtreras.api.service.ProductService;
import py.com.econtreras.entity.*;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
    @Autowired
    private InventoryRepository inventoryRepository;
    @Autowired
    private MotiveRepository motiveRepository;
    @Autowired
    private WarehouseRepository warehouseRepository;
    private static final String STATUS_CONFIRMATION = "CONFIRMADO";
    private static final String MOTIVE_SALE = "VENTA";
    private static final String OPERATION_TYPE_OUT = "OUT";

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
                    ProductSolicitude productSolicitude = optionalProductSolicitude.isPresent() ? optionalProductSolicitude.get() : new ProductSolicitude();
                    productSolicitude.setMerSolicitudesPK(pk);
                    productSolicitude.setQuantity(bean.getQuantity());
                    productSolicitude.setPrice(bean.getPrice());
                    productSolicitude.setPurchasePrice(bean.getPurcharsePrice());
                    products.add(productSolicitude);


                }
            }

            Iterable<ProductSolicitude> pIterable = productSolicitudeRepository.saveAll(products);
            solicitude.setProdcutSolicitudeList(products);
            solicitude = solicitudeRepository.save(solicitude);
            List<Inventory> inventoryList = new ArrayList<>();

            Optional<Warehouse> wh = warehouseRepository.findById(1);

            if(solicitude.getStatus().getStatusName().equalsIgnoreCase(STATUS_CONFIRMATION)){
                for (ProductSolicitude productSolicitude : products) {
                    Optional<Product> productOptional = productRepository.findById(productSolicitude.getMerSolicitudesPK().getProductId());
                    if(productOptional.isPresent()){
                        Product product = productOptional.get();
                        List<Inventory> inventoriesByProduct = inventoryRepository.findByProduct(product);
                        Inventory inventory = new Inventory();
                        inventory.setProduct(productOptional.get());
                        inventory.setCreationDate(new Date());
                        inventory.setMotive(motiveRepository.findByMotiveName(MOTIVE_SALE));
                        inventory.setOperationType(OPERATION_TYPE_OUT);
                        inventory.setOperationQuantity(productSolicitude.getQuantity());
                        inventory.setPurchasePrice(calclulateProductInventory(inventoriesByProduct));
                        inventory.setWarehouse(wh.get());
                        inventoryList.add(inventory);
                    }
                }

            }
            cartBean.setStatus(solicitude.getStatus().getStatusName());
            cartBean.setSolicitudeId(solicitude.getId());

            inventoryRepository.saveAll(inventoryList);
            return  new ResponseEntity<>(cartBean, HttpStatus.OK);

        }
        return  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    private double calclulateProductInventory(List<Inventory> inventorylist){
        Double sum = inventorylist.stream().map(inventory -> inventory.getPurchasePrice()).collect(Collectors.summingDouble(Double::doubleValue));
        return BigInteger.valueOf(sum.longValue()).divide(BigInteger.valueOf(inventorylist.size())).doubleValue();
    }


}
