package dev.ubaid.ps.service;

import dev.ubaid.ps.service.dto.PostDTO;
import dev.ubaid.ps.service.dto.PostWithUuidDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PostService {
    Page<PostDTO> findAll(Pageable pageable);
    PostDTO findByUuid(String uuid);
    PostWithUuidDTO create(PostDTO postDTO);
}
