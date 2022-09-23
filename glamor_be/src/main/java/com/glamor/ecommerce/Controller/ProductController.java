package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.ProductRequest;
import com.glamor.ecommerce.Dto.ProductResponse;
import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Service.ProductService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/product")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/get/products")
    public List<ProductResponse> getAllProducts(){
        return productService.getProducts();
    }

    @GetMapping("/get/{productId}")
    public ProductResponse getProductById(@PathVariable Long productId){
        return productService.getProduct(productId);
    }

    @PostMapping("/create")
    public Product createProduct(@RequestBody ProductRequest product){
        return productService.saveProduct(product);
    }
}
