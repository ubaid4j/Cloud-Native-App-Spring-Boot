package dev.ubaid.ps.service;

import dev.ubaid.ps.service.dto.PostDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PostService {
    Page<PostDTO> findAll(Pageable pageable);
}
