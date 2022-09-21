package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.UserRequest;
import com.glamor.ecommerce.Entities.User;
import com.glamor.ecommerce.Service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping
    public User createUser(@RequestBody UserRequest user){
        return userService.saveUser(user);
    }
}
