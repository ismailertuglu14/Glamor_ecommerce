package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.ProductRequest;
import com.glamor.ecommerce.Dto.ProductResponse;
import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Exceptions.BrandNotFoundException;
import com.glamor.ecommerce.Exceptions.ProductNotFoundException;
import com.glamor.ecommerce.Exceptions.UserNotFoundException;
import com.glamor.ecommerce.Repository.BrandRepository;
import com.glamor.ecommerce.Repository.ProductRepository;
import com.glamor.ecommerce.Repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final BrandRepository brandRepository;
    private final UserRepository userRepository;

    public ProductService(ProductRepository productRepository, BrandRepository brandRepository, UserRepository userRepository) {
        this.productRepository = productRepository;
        this.brandRepository = brandRepository;
        this.userRepository = userRepository;
    }

    public Product saveProduct(ProductRequest newProduct){
        Product product = new Product();
        product.setTitle(newProduct.getTitle());
        product.setPrice(newProduct.getPrice());
        product.setDescrpition(newProduct.getDescription());
        product.setLocation(newProduct.getLocation());
        product.setBrand(brandRepository.findById(newProduct.getBrand_id()).orElseThrow(() -> new BrandNotFoundException("Brand not found.")));
        product.setUser(userRepository.findById(newProduct.getUser_id()).orElseThrow(() -> new UserNotFoundException("User not found.")));
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
        return response;
    }
}
