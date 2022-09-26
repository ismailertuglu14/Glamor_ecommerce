package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,Long> {
}
