package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FavoriteRepository extends JpaRepository<Favorite,Long> {
}
