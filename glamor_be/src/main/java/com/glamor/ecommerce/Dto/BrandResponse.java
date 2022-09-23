package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.Product;
import lombok.Data;

import java.util.List;

@Data
public class BrandResponse {
    private String name;
    private List<Product> products;
}
