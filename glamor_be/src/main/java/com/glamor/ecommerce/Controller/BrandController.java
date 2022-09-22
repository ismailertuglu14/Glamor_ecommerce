package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.BrandRequest;
import com.glamor.ecommerce.Dto.UserRequest;
import com.glamor.ecommerce.Entities.Brand;
import com.glamor.ecommerce.Entities.User;
import com.glamor.ecommerce.Service.BrandService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/brand")
public class BrandController {
    private final BrandService brandService;

    public BrandController(BrandService brandService) {
        this.brandService = brandService;
    }

    @PostMapping
    public Brand createBrand(@RequestBody BrandRequest brand){
        return brandService.saveBrand(brand);
    }
}
