package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.Product;
import lombok.Data;

import java.util.List;

@Data
public class UserResponse {
    private String name;
    private String lastname;
    private String password;
    private String avatar;
    private List<Product> products;
}
