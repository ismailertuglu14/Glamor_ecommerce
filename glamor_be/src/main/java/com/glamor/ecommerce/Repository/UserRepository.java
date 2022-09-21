package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
}
