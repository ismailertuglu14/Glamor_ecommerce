package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.Brand;
import com.glamor.ecommerce.Entities.User;
import lombok.Data;

@Data
public class ProductResponse {
    private String title;
    private String description;
    private double price;
    private String location;
    private Brand brand;
    private User user;
}
