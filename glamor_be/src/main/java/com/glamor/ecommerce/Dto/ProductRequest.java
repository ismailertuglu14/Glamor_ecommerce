package com.glamor.ecommerce.Dto;

import lombok.Data;

import java.util.List;

@Data
public class ProductRequest {
    private String title;
    private String description;
    private double price;
    private String location;
    private Long brand_id;
    private Long user_id;
    private List<Long> subcategory_ids;
    private List<Long> image_ids;
}
