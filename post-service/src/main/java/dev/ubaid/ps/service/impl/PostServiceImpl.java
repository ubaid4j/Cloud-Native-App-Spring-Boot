package dev.ubaid.ps.service.impl;

import dev.ubaid.ps.domain.Post;
import dev.ubaid.ps.domain.PostDetail;
import dev.ubaid.ps.repository.PostRepository;
import dev.ubaid.ps.service.PostService;
import dev.ubaid.ps.service.dto.PostDTO;
import dev.ubaid.ps.service.dto.PostWithUuidDTO;
import dev.ubaid.ps.service.mapper.PostMapper;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

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

    @Override
    public PostDTO findByUuid(String uuid) {
        
        Post post = new Post();
        post.setUuid(uuid);
        
        ExampleMatcher matchUuid = ExampleMatcher.matching()
                .withMatcher("uuid", ExampleMatcher.GenericPropertyMatchers.exact())
                .withIgnoreNullValues();
        
        Example<Post> byUuid = Example.of(post, matchUuid);
        
        return postRepository
                .findOne(byUuid)
                .map(postMapper::toDTO)
                .orElseThrow(() -> new RuntimeException("Post is not found by uuid: {}" + uuid));
    }

    @Override
    public PostWithUuidDTO create(PostDTO postDTO) {
        Post post = postMapper.toEntity(postDTO);
        
        post.setUuid(UUID.randomUUID().toString());
        post.setVersion(1);
        
        PostDetail postDetail = post.getPostDetail();
        postDetail.setUuid(UUID.randomUUID().toString());
        postDetail.setVersion(1);
        postDetail.setPost(post);
        
        post = postRepository.save(post);
        return new PostWithUuidDTO(post.getUuid());
    }
}
