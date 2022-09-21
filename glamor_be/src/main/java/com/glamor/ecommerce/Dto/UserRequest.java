package com.glamor.ecommerce.Dto;

import lombok.Data;

@Data
public class UserRequest {
    private String name;
    private String lastname;
    private String password;
    private String avatar;
}
