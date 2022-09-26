package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.SubcategoryRequest;
import com.glamor.ecommerce.Entities.Subcategory;
import com.glamor.ecommerce.Repository.CategoryRepository;
import com.glamor.ecommerce.Repository.SubcategoryRepository;
import org.springframework.stereotype.Service;

@Service
public class SubcategoryService {
    private final SubcategoryRepository subcategoryRepository;
    private final CategoryRepository categoryRepository;

    public SubcategoryService(SubcategoryRepository subcategoryRepository, CategoryRepository categoryRepository) {
        this.subcategoryRepository = subcategoryRepository;
        this.categoryRepository = categoryRepository;
    }

    public Subcategory saveSubcategory(SubcategoryRequest newSubcategory) {
        Subcategory subcategory = new Subcategory();
        subcategory.setTitle(newSubcategory.getTitle());
        subcategory.setCategory(categoryRepository.findById(newSubcategory.getCategory_id()).orElse(null));
        return subcategoryRepository.save(subcategory);
    }
}
