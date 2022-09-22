package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.ProductRequest;
import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/product")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public Product createProduct(@RequestBody ProductRequest product){
        return productService.saveProduct(product);
    }
}
