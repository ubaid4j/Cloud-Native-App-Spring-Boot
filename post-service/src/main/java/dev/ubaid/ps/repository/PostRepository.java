package dev.ubaid.ps.repository;

import dev.ubaid.ps.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post, Long> {
}
