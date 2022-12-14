package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.UserRequest;
import com.glamor.ecommerce.Dto.UserResponse;
import com.glamor.ecommerce.Entities.User;
import com.glamor.ecommerce.Exceptions.UserNotFoundException;
import com.glamor.ecommerce.Repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User saveUser(UserRequest newUser){
        User user = new User();
        user.setName(newUser.getName());
        user.setLastname(newUser.getLastname());
        user.setEmail(newUser.getEmail());
        user.setPassword(newUser.getPassword());
        user.setAvatar(newUser.getAvatar());
        return userRepository.save(user);
    }

    public UserResponse getUser(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new UserNotFoundException("User not found."));
        UserResponse response = new UserResponse();
        response.setName(user.getName());
        response.setLastname(user.getLastname());
        response.setEmail(user.getEmail());
        response.setAvatar(user.getAvatar());
        response.setPassword(user.getPassword());
        response.setProducts(user.getProduct());
        response.setFavorites(user.getFavorite().stream().map(favorite -> favorite.getProduct()).collect(Collectors.toList()));
        return response;
    }
}
