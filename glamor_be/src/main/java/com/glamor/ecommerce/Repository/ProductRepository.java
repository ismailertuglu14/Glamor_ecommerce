package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product,Long> {
}
