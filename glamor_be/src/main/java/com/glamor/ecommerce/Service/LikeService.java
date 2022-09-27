package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.LikeRequest;
import com.glamor.ecommerce.Dto.LikeResponse;
import com.glamor.ecommerce.Entities.Like;
import com.glamor.ecommerce.Exceptions.ProductNotFoundException;
import com.glamor.ecommerce.Exceptions.UserNotFoundException;
import com.glamor.ecommerce.Repository.LikeRepository;
import com.glamor.ecommerce.Repository.ProductRepository;
import com.glamor.ecommerce.Repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
    private final LikeRepository likeRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;

    public LikeService(LikeRepository likeRepository, UserRepository userRepository, ProductRepository productRepository) {
        this.likeRepository = likeRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
    }

    public Like saveLike(LikeRequest newLike) {
        Like like = new Like();
        like.setUser(userRepository.findById(newLike.getUser_id()).orElseThrow(() -> new UserNotFoundException("User not found.")));
        like.setProduct(productRepository.findById(newLike.getProduct_id()).orElseThrow(() -> new ProductNotFoundException("Product not found.")));
        return likeRepository.save(like);
    }

    public LikeResponse getLike(Long likeId) {
        Like like = likeRepository.findById(likeId).orElse(null);
        LikeResponse response = new LikeResponse();
        response.setProduct(like.getProduct());
        response.setUser(like.getUser());
        return response;
    }
}
