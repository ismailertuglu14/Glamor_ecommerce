package com.glamor.ecommerce.Dto;

import com.glamor.ecommerce.Entities.Product;
import com.glamor.ecommerce.Entities.User;
import lombok.Data;

@Data
public class LikeResponse {
    private Product product;
    private User user;
}
