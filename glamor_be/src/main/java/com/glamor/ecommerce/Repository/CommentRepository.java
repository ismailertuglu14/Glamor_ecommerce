package com.glamor.ecommerce.Repository;

import com.glamor.ecommerce.Entities.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment,Long> {
}
