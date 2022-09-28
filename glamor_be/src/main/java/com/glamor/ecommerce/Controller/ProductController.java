package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.ProductRequest;
import com.glamor.ecommerce.Dto.ProductResponse;
import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Service.ProductService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/v1/product")
public class ProductController {
    private final ProductService productService;

    @Value("${file.upload-dir}")
    String FILE_DIRECTORY;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/all")
    public List<ProductResponse> getAllProducts(){
        return productService.getProducts();
    }

    @GetMapping("/{productId}")
    public ProductResponse getProductById(@PathVariable Long productId){
        return productService.getProduct(productId);
    }

    @PostMapping("/create")
    public Product createProduct(@ModelAttribute ProductRequest product){
        String direc = FILE_DIRECTORY +"\\"+ product.getTitle()+"\\";
        File newDirec = new File(direc);
        newDirec.mkdir();
        product.getImages().stream().forEach(image -> {
            try {
                File myFile = new File(direc+image.getOriginalFilename());
                myFile.createNewFile();
                FileOutputStream fos =new FileOutputStream(myFile);
                fos.write(image.getBytes());
                fos.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
        return productService.saveProduct(product);
    }
}
