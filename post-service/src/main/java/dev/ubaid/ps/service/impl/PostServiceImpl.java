package dev.ubaid.ps.service.impl;

import dev.ubaid.ps.domain.Post;
import dev.ubaid.ps.repository.PostRepository;
import dev.ubaid.ps.service.PostService;
import dev.ubaid.ps.service.dto.PostDTO;
import dev.ubaid.ps.service.mapper.PostMapper;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class PostServiceImpl implements PostService {
    
    private final PostRepository postRepository;
    private final PostMapper postMapper;

    public PostServiceImpl(PostRepository postRepository, PostMapper postMapper) {
        this.postRepository = postRepository;
        this.postMapper = postMapper;
    }

    @Override
    public Page<PostDTO> findAll(Pageable pageable) {

        Post post = new Post();
        post.setCreatedBy("system");

        ExampleMatcher matchUser = ExampleMatcher.matching()
                        .withMatcher("createdBy", ExampleMatcher.GenericPropertyMatchers.exact())
                        .withIgnoreNullValues();
        
        Example<Post> byUser = Example.of(post, matchUser);
        
        return postRepository
                .findAll(byUser, pageable)
                .map(postMapper::toDTO);
    }
}
