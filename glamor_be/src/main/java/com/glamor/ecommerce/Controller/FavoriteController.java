package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.FavoriteRequest;
import com.glamor.ecommerce.Dto.LikeRequest;
import com.glamor.ecommerce.Entities.Favorite;
import com.glamor.ecommerce.Entities.Like;
import com.glamor.ecommerce.Service.FavoriteService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/favorite")
public class FavoriteController {
    private final FavoriteService favoriteService;

    public FavoriteController(FavoriteService favoriteService) {
        this.favoriteService = favoriteService;
    }

    @PostMapping("/create")
    public Favorite createFavorite(@RequestBody FavoriteRequest favorite){
        return favoriteService.saveFavorite(favorite);
    }
}
