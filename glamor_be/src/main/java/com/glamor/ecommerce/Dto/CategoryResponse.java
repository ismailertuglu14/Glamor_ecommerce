package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Entities.Subcategory;
import lombok.Data;

import java.util.List;

@Data
public class CategoryResponse {
    private String title;
    private List<Subcategory> subcategories;
}
