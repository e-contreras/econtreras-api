package py.com.econtreras.api.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.ImageRequest;
import py.com.econtreras.api.beans.ProductRequest;
import py.com.econtreras.api.beans.ProductResponse;
import py.com.econtreras.api.beans.Productstore;
import py.com.econtreras.api.converter.ImageConverter;
import py.com.econtreras.api.converter.ProductConverter;
import py.com.econtreras.api.converter.ProductImageConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.*;
import py.com.econtreras.api.service.ProductService;
import py.com.econtreras.entity.Image;
import py.com.econtreras.entity.Inventory;
import py.com.econtreras.entity.Product;
import py.com.econtreras.entity.ProductImage;
import py.com.econtreras.entity.ProductImagePK;

@Service
public class ProductServiceImpl implements ProductService {

    private static final BigInteger PERCENTAGE_OF_PROFIT = new BigInteger("40");

    @Autowired
    private ProductRepository repository;
    @Autowired
    private ProductConverter converter;
    @Autowired
    private InventoryRepository inventoryRepository;
    @Autowired
    private ProductImageRepository productImageRepository;
    @Autowired
    private ImageConverter imageConverter;
    @Autowired
    private ImageRepository imageRepository;
    @Autowired
    private ProductImageConverter productImageConverter;
    @Autowired
    ApiMessage message;
    private Link[] links;

    private static final Logger LOGGER = LogManager.getLogger(ProductServiceImpl.class);

    @Override
    public ProductResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.Product> optional = repository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<ProductResponse> findAll() {
        try {
            Iterable<py.com.econtreras.entity.Product> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }
            List<ProductResponse> beans = new ArrayList<>();
            for (py.com.econtreras.entity.Product entity : entityList) {
                beans.add(this.getBean(entity));
            }
            return beans;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public ProductResponse save(ProductRequest product) {
        try {
            Product produc = repository.save(converter.buildEntity(product));
            if (!product.getFile().isEmpty()) {
                for (int i = 0; i < product.getFile().size(); i++) {
                    ImageRequest imageRequest = new ImageRequest();
                    imageRequest.setOrder(i);
                    imageRequest.setSrc(product.getFile().get(i));
                    Image image = imageRepository.save(imageConverter.buildEntity(imageRequest));

                    ProductImage productImage = new ProductImage();
                    ProductImagePK productImagePK = new ProductImagePK();
                    productImagePK.setImage(image.getId());
                    productImagePK.setProduct(produc.getId());
                    productImage.setMerImagenesPK(productImagePK);
                    productImage.setPrincipal('S');

                    productImageRepository.save(productImage);
                }
            }
            return this.getBean(repository.save(converter.buildEntity(product)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public ProductResponse update(ProductRequest product) {
        try {
            Optional<py.com.econtreras.entity.Product> optionalEntity = repository.findById(product.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(repository.save(converter.buildEntity(product)));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public Boolean delete(Integer id) {
        Optional<py.com.econtreras.entity.Product> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.entity.Product product = optionalEntity.get();
            product.setErased(new Short("1"));
            repository.save(product);
            return true;
        }
    }

    private ProductResponse getBean(py.com.econtreras.entity.Product product) {
        links = cargarEnlaces(product);
        if (links == null || links.length == 0) {
            return converter.buildBean(product);
        } else {
            return converter.buildBean(product, links);
        }
    }

    private Link[] cargarEnlaces(py.com.econtreras.entity.Product product) {
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/products/" + product.getId()).withSelfRel());
        if (product.getBrand() != null) {
            link = new Link("http://localhost:8080/brands/" + product.getBrand().getId()).withRel("brand");
            l.add(link);
        }
        if (product.getCategory() != null) {
            link = new Link("http://localhost:8080/categories/" + product.getCategory().getId()).withRel("category");
            l.add(link);
        }

        Link[] linkArray = new Link[l.size()];
        for (int i = 0; i < l.size(); i++) {
            Link lo = l.get(i);
            linkArray[i] = lo;
        }
        return linkArray;
    }

    @Override
    public List<Productstore> findAllProductStore() {
        Iterable<Product> productIt = repository.findAll();
        List<Productstore> productstores = new ArrayList<>();
        productIt.forEach(product -> {
            Long inCount = inventoryRepository.countByProductIdAndMotive(product.getId(), "IN");
            inCount = inCount != null ? inCount : 0L;
            Long outCount = inventoryRepository.countByProductIdAndMotive(product.getId(), "OUT");
            outCount = outCount != null ? outCount : 0L;
            Long availabe = inCount >= outCount ? inCount - outCount : 0L;
            if (availabe > 0) {
                Long average = getPriceAvg(product);
                BigInteger salePrice = BigInteger.valueOf(average).multiply(PERCENTAGE_OF_PROFIT).divide(BigInteger.valueOf(100)).add(BigInteger.valueOf(average));
                Productstore productstore = new Productstore();
                productstore.setAvailable(availabe.intValue());
                productstore.setId(product.getId());
                productstore.setPurchasePrice(BigInteger.valueOf(average));
                productstore.setSalePrice(salePrice);
                productstore.setProductName(product.getProductName());
                productstore.setBrand(product.getBrand().getDescription());
                productstore.setDescription(product.getDescription());
                productstore.setCategoryId(product.getCategory().getId());
                productstore.setCategoryName(product.getCategory().getDescription());
                List<ProductImage> productImages = productImageRepository.findByProduct(product);
                List<String> images = new ArrayList<>();
                productImages.forEach(productImage -> {
                    if (productImage.getImage() != null && productImage.getImage().getSrc() != null) {
                        images.add(Base64.getEncoder().encodeToString(productImage.getImage().getSrc()));
                    }

                });
                productstore.setImages(images);
                productstores.add(productstore);
            }
        });

        return productstores;
    }

    private Long getPriceAvg(Product product) {
        List<Inventory> inventories = inventoryRepository.findByProduct(product);
        Double sum = inventories.stream().map(inventory -> inventory.getPurchasePrice()).collect(Collectors.summingDouble(Double::doubleValue));
        Double avg = sum / inventories.size();
        return avg.longValue();
    }

}
