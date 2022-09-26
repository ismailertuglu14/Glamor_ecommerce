package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product,Long> {
}
