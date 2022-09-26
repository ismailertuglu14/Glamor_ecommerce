package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.Brand;
import com.glamor.ecommerce.Entities.Subcategory;
import com.glamor.ecommerce.Entities.User;
import lombok.Data;

import java.util.List;

@Data
public class ProductResponse {
    private String title;
    private String description;
    private double price;
    private String location;
    private Brand brand;
    private User user;
    private List<Subcategory> subcategories;
}
