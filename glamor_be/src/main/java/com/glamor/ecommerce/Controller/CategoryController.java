package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.CategoryRequest;
import com.glamor.ecommerce.Dto.CategoryResponse;
import com.glamor.ecommerce.Entities.Category;
import com.glamor.ecommerce.Service.CategoryService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/category")
public class CategoryController {
    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/{categoryId}")
    public CategoryResponse getCategoryById(@PathVariable Long categoryId){
        return categoryService.getCategory(categoryId);
    }

    @PostMapping("/create")
    public Category createCategory(@RequestBody CategoryRequest categoryRequest){
        return categoryService.saveCategory(categoryRequest);
    }
}
