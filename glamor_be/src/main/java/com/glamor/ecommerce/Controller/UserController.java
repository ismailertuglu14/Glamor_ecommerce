package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.UserRequest;
import com.glamor.ecommerce.Dto.UserResponse;
import com.glamor.ecommerce.Entities.User;
import com.glamor.ecommerce.Service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/get/{userId}")
    public UserResponse getUserById(@PathVariable Long userId){
        return userService.getUser(userId);
    }

    @PostMapping("/create")
    public User createUser(@RequestBody UserRequest user){
        return userService.saveUser(user);
    }
}
