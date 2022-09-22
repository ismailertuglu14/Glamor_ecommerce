package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.BrandRequest;
import com.glamor.ecommerce.Entities.Brand;
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
}
