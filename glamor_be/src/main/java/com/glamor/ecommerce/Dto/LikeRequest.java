package com.glamor.ecommerce.Dto;

import lombok.Data;

@Data
public class LikeRequest {
    private Long user_id;
    private Long product_id;
}
