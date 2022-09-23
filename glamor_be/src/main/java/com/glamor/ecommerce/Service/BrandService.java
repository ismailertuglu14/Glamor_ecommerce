package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.BrandRequest;
import com.glamor.ecommerce.Dto.BrandResponse;
import com.glamor.ecommerce.Entities.Brand;
import com.glamor.ecommerce.Exceptions.BrandNotFoundException;
import com.glamor.ecommerce.Repository.BrandRepository;
import org.springframework.stereotype.Service;

@Service
public class BrandService {
    private final BrandRepository brandRepository;

    public BrandService(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    public Brand saveBrand(BrandRequest newBrand) {
        Brand brand = new Brand();
        brand.setName(newBrand.getName());
        return brandRepository.save(brand);
    }

    public BrandResponse getBrand(Long brandId) {
        Brand brand = brandRepository.findById(brandId).orElseThrow(() -> new BrandNotFoundException("Brand not found."));
        BrandResponse response = new BrandResponse();
        response.setName(brand.getName());
        response.setProducts(brand.getProduct());
        return response;
    }
}
