package dev.ubaid.ps.web.rest;

import dev.ubaid.ps.service.PostService;
import dev.ubaid.ps.service.dto.PostDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/post")
public class PostResource {
    
    private final PostService postService;

    public PostResource(PostService postService) {
        this.postService = postService;
    }

    ResponseEntity<Page<PostDTO>> findAll(Pageable pageable) {
        return ResponseEntity.ok(postService.findAll(pageable));
    }
}
