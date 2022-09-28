package com.glamor.ecommerce.Dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class ProductRequest {
    private String title;
    private String description;
    private double price;
    private String location;
    private Long brand_id;
    private Long user_id;
    private List<MultipartFile> images;
    private List<Long> product_subcategory;
}
