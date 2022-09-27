package com.glamor.ecommerce.Service;

import com.glamor.ecommerce.Dto.FavoriteRequest;
import com.glamor.ecommerce.Entities.Favorite;
import com.glamor.ecommerce.Repository.FavoriteRepository;
import com.glamor.ecommerce.Repository.ProductRepository;
import com.glamor.ecommerce.Repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class FavoriteService {
    private final FavoriteRepository favoriteRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;

    public FavoriteService(FavoriteRepository favoriteRepository, UserRepository userRepository, ProductRepository productRepository) {
        this.favoriteRepository = favoriteRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
    }

    public Favorite saveFavorite(FavoriteRequest favorite) {
        Favorite newFavorite = new Favorite();
        newFavorite.setUser(userRepository.findById(favorite.getUser_id()).orElse(null));
        newFavorite.setProduct(productRepository.findById(favorite.getProduct_id()).orElse(null));
        return favoriteRepository.save(newFavorite);
    }
}
