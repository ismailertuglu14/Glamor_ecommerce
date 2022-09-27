package com.glamor.ecommerce.Dto;

import lombok.Data;

@Data
public class FavoriteRequest {
    private Long user_id;
    private Long product_id;
}
