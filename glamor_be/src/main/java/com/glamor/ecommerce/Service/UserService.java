package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.UserRequest;
import com.glamor.ecommerce.Entities.User;
import com.glamor.ecommerce.Repository.UserRepository;
import org.springframework.stereotype.Service;

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
        user.setPassword(newUser.getPassword());
        user.setAvatar(newUser.getAvatar());
        return userRepository.save(user);
    }
}
