package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.*;
import lombok.Data;

import java.util.List;
import java.util.Set;

@Data
public class ProductResponse {
    private String title;
    private String description;
    private double price;
    private String location;
    private Brand brand;
    private User user;
    private List<Subcategory> subcategories;
    private Set<Category> categories;
    private List<Image> images;
    private int total_like;
}
