package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.SubcategoryRequest;
import com.glamor.ecommerce.Entities.Subcategory;
import com.glamor.ecommerce.Service.SubcategoryService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/subcategory")
public class SubcategoryController {
    private final SubcategoryService subcategoryService;

    public SubcategoryController(SubcategoryService subcategoryService) {
        this.subcategoryService = subcategoryService;
    }

    @PostMapping("/create")
    public Subcategory createSubcategory(@RequestBody SubcategoryRequest subcategoryRequest){
        return subcategoryService.saveSubcategory(subcategoryRequest);
    }
}
