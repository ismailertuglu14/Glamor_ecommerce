package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.CategoryRequest;
import com.glamor.ecommerce.Dto.CategoryResponse;
import com.glamor.ecommerce.Dto.ProductResponse;
import com.glamor.ecommerce.Entities.Category;
import com.glamor.ecommerce.Repository.CategoryRepository;
import com.glamor.ecommerce.Repository.ProductRepository;
import com.glamor.ecommerce.Repository.SubcategoryRepository;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;
    private final SubcategoryRepository subcategoryRepository;

    public CategoryService(CategoryRepository categoryRepository, ProductRepository productRepository, SubcategoryRepository subcategoryRepository) {
        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
        this.subcategoryRepository = subcategoryRepository;
    }

    public Category saveCategory(CategoryRequest newCategory){
        Category category = new Category();
        category.setTitle(newCategory.getTitle());
        return categoryRepository.save(category);
    }

    public CategoryResponse getCategory(Long categoryId) {
        Category category = categoryRepository.findById(categoryId).orElse(null);
        CategoryResponse response = new CategoryResponse();
        response.setTitle(category.getTitle());
        response.setSubcategories(subcategoryRepository.findSubcategoriesByCategoryId(categoryId));
        return response;
    }
}
