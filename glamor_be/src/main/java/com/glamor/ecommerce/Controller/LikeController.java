package com.glamor.ecommerce.Controller;

import com.glamor.ecommerce.Dto.LikeRequest;
import com.glamor.ecommerce.Dto.LikeResponse;
import com.glamor.ecommerce.Entities.Like;
import com.glamor.ecommerce.Service.LikeService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/like")
public class LikeController {
    private final LikeService likeService;

    public LikeController(LikeService likeService) {
        this.likeService = likeService;
    }

    @PostMapping("/create")
    public Like createLike(@RequestBody LikeRequest like){
        return likeService.saveLike(like);
    }

    @GetMapping("/{likeId}")
    public LikeResponse getLikeById(@PathVariable Long likeId){
        return likeService.getLike(likeId);
    }
}
