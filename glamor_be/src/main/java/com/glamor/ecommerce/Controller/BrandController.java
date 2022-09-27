package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.BrandRequest;
import com.glamor.ecommerce.Dto.BrandResponse;
import com.glamor.ecommerce.Entities.Brand;
import com.glamor.ecommerce.Service.BrandService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/brand")
public class BrandController {
    private final BrandService brandService;

    public BrandController(BrandService brandService) {
        this.brandService = brandService;
    }

    @GetMapping("/{brandId}")
    public BrandResponse getBrandById(@PathVariable Long brandId){
        return brandService.getBrand(brandId);
    }

    @PostMapping("/create")
    public Brand createBrand(@RequestBody BrandRequest brand){
        return brandService.saveBrand(brand);
    }
}
