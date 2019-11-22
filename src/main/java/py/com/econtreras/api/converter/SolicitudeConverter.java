package py.com.econtreras.api.converter;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import py.com.econtreras.api.beans.Productstore;
import py.com.econtreras.api.beans.SolicitudeResponse;
import py.com.econtreras.api.repository.InventoryRepository;
import py.com.econtreras.api.repository.ProductImageRepository;
import py.com.econtreras.entity.Inventory;
import py.com.econtreras.entity.Product;
import py.com.econtreras.entity.ProductImage;
import py.com.econtreras.entity.ProductSolicitude;
import py.com.econtreras.entity.Solicitude;

@Component
public class SolicitudeConverter {

    @Autowired
    private ProductImageRepository productImageRepository;
    
    @Autowired
    private InventoryRepository inventoryRepository;
    
    private static final BigInteger PERCENTAGE_OF_PROFIT = new BigInteger("40");    

    public SolicitudeResponse entityToModel(Solicitude entity) {
        SolicitudeResponse model = new SolicitudeResponse();
        model.setId(entity.getId());
        model.setConfirmationDate(entity.getConfirmationDate());
        model.setCreationDate(entity.getCreationDate());
        model.setStatus(entity.getStatus().getStatusName());
        List<ProductSolicitude> products = entity.getProdcutSolicitudeList();
        if (products != null && !products.isEmpty()) {

            List<Productstore> productsModel = new ArrayList<>();
            for (ProductSolicitude product : products) {

                Long inCount = inventoryRepository.countByProductIdAndMotive(product.getProduct().getId(), "IN");
                inCount = inCount != null ? inCount : 0L;
                Long outCount = inventoryRepository.countByProductIdAndMotive(product.getProduct().getId(), "OUT");
                outCount = outCount != null ? outCount : 0L;
                Long available = inCount >= outCount ? inCount - outCount : 0L;

                Long average = getPriceAvg(product.getProduct());
                BigInteger salePrice = BigInteger.valueOf(average).multiply(PERCENTAGE_OF_PROFIT).divide(BigInteger.valueOf(100)).add(BigInteger.valueOf(average));                
                
                Productstore productModel = new Productstore();
                productModel.setBrand(product.getProduct().getBrand().getDescription());
                productModel.setCategoryId(product.getProduct().getCategory().getId());
                productModel.setCategoryName(product.getProduct().getCategory().getDescription());
                productModel.setDescription(product.getProduct().getDescription());
                productModel.setId(product.getProduct().getId());
                productModel.setProductName(product.getProduct().getProductName());
                
                productModel.setPurchasePrice(BigInteger.valueOf(average));
                productModel.setSalePrice(salePrice);                
                
                productModel.setQuantity(product.getQuantity());

                List<ProductImage> productImages = productImageRepository.findByProduct(product.getProduct());
                List<String> images = new ArrayList<>();
                productImages.forEach(productImage -> {
                    if (productImage.getImage() != null && productImage.getImage().getSrc() != null) {
                        images.add(Base64.getEncoder().encodeToString(productImage.getImage().getSrc()));
                    }
                });
                productModel.setImages(images);
                productsModel.add(productModel);
            }
            model.setProductBeanList(productsModel);
        }
        return model;
    }
    
    private Long getPriceAvg(Product product){
        List<Inventory> inventories = inventoryRepository.findByProduct(product);
        Double sum = inventories.stream().map(inventory -> inventory.getPurchasePrice()).collect(Collectors.summingDouble(Double::doubleValue));
        Double avg = sum / inventories.size();
        return avg.longValue();
    }    

    public List<SolicitudeResponse> entitiesToModels(List<Solicitude> entities) {
        List<SolicitudeResponse> models = new ArrayList<>();
        if (entities == null || entities.isEmpty()) {
            return models;
        }
        for (Solicitude solicitude : entities) {
            List<ProductSolicitude> products = solicitude.getProdcutSolicitudeList();
            if (products != null && !products.isEmpty()) {
                models.add(this.entityToModel(solicitude));
            }
        }
        return models;
    }

}
