package dev.ubaid.ps.web.rest;

import dev.ubaid.ps.service.PostService;
import dev.ubaid.ps.service.dto.PostDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;

@RestController
@RequestMapping("/api/post")
public class PostResource {
    
    private final PostService postService;

    public PostResource(PostService postService) {
        this.postService = postService;
    }

    @GetMapping
    ResponseEntity<Page<PostDTO>> findAll(Pageable pageable) {
        return ResponseEntity.ok(postService.findAll(pageable));
    }
    
    @GetMapping("/{uuid}")
    ResponseEntity<PostDTO> findByUuid(@PathVariable String uuid) {
        return ResponseEntity.ok(postService.findByUuid(uuid));
    }
    
    @PostMapping
    ResponseEntity<String> create(@RequestBody PostDTO postDTO) {
        return ResponseEntity
                .created(URI.create("/api/post/" + postService.create(postDTO).uuid()))
                .build();
    }
}
