package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.ProductRequest;
import com.glamor.ecommerce.Dto.ProductResponse;
import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Entities.ProductSubcategory;
import com.glamor.ecommerce.Exceptions.BrandNotFoundException;
import com.glamor.ecommerce.Exceptions.ProductNotFoundException;
import com.glamor.ecommerce.Exceptions.UserNotFoundException;
import com.glamor.ecommerce.Repository.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final BrandRepository brandRepository;
    private final UserRepository userRepository;
    private final ProductSubcategoryRepository productSubcategoryRepository;
    private final SubcategoryRepository subcategoryRepository;

    public ProductService(ProductRepository productRepository, BrandRepository brandRepository, UserRepository userRepository, ProductSubcategoryRepository productSubcategoryRepository, SubcategoryRepository subcategoryRepository) {
        this.productRepository = productRepository;
        this.brandRepository = brandRepository;
        this.userRepository = userRepository;
        this.productSubcategoryRepository = productSubcategoryRepository;
        this.subcategoryRepository = subcategoryRepository;
    }

    public Product saveProduct(ProductRequest newProduct){
        Product product = new Product();
        product.setTitle(newProduct.getTitle());
        product.setPrice(newProduct.getPrice());
        product.setDescrpition(newProduct.getDescription());
        product.setLocation(newProduct.getLocation());
        product.setBrand(brandRepository.findById(newProduct.getBrand_id()).orElseThrow(() -> new BrandNotFoundException("Brand not found.")));
        product.setUser(userRepository.findById(newProduct.getUser_id()).orElseThrow(() -> new UserNotFoundException("User not found.")));
        product.setProduct_subcategory(newProduct.getProduct_subcategory().stream().map(subcategory -> {
            ProductSubcategory productSubcategory = new ProductSubcategory();
            productSubcategory.setProduct(product);
            productSubcategory.setSubcategory(subcategoryRepository.findById(subcategory).orElse(null));
            return productSubcategory;
        }).collect(Collectors.toList()));
        return productRepository.save(product);
    }

    public ProductResponse getProduct(Long productId) {
        Product product = productRepository.findById(productId).orElseThrow(() -> new ProductNotFoundException("Product not found."));
        ProductResponse response = new ProductResponse();
        response.setTitle(product.getTitle());
        response.setDescription(product.getDescrpition());
        response.setPrice(product.getPrice());
        response.setLocation(product.getLocation());
        response.setUser(product.getUser());
        response.setBrand(product.getBrand());
        response.setSubcategories(product.getProduct_subcategory().stream().map(subcategory -> subcategory.getSubcategory()).collect(Collectors.toList()));
        return response;
    }

    public List<ProductResponse> getProducts() {
        List<ProductResponse> products = productRepository.findAll().stream().map(product -> {
            ProductResponse new1 = new ProductResponse();
            new1.setTitle(product.getTitle());
            new1.setDescription(product.getDescrpition());
            new1.setPrice(product.getPrice());
            new1.setLocation(product.getLocation());
            new1.setUser(product.getUser());
            new1.setBrand(product.getBrand());
            return new1;
        }).collect(Collectors.toList());
        return products;
    }
}
