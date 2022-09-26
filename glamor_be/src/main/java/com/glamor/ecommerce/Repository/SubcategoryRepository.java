package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.Subcategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SubcategoryRepository extends JpaRepository<Subcategory,Long> {
    List<Subcategory> findSubcategoriesByCategoryId(Long categoryId);
}
