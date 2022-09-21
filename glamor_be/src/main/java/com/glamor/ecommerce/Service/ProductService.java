package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.ProductRequest;
import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Repository.ProductRepository;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    /*
    public Product saveProduct(ProductRequest newProduct){

    }
     */
}
