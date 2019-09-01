package com.ubaid.app.controller;

import java.net.URI;
import java.util.List;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.ubaid.app.entity.Post;
import com.ubaid.app.exception.PostNotFound;
import com.ubaid.app.service.IPostService;

@RestController
@RequestMapping("users")
public class PostController
{
	@Autowired
	private IPostService service;
	
	//create
	@PostMapping("{id}/posts")
	public ResponseEntity<Void> createPost(@PathVariable("id") int id, @RequestBody Post post)
	{
		post = service.createPost(id, post);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(post.getId()).toUri();
		return ResponseEntity.created(uri).build();
	}
	
	//read
	@GetMapping("{id}/posts/{post_id}")
	public Resource<Post> getPost(@PathVariable("id") int userId, @PathVariable("post_id") int post_id)
	{
		try
		{
			Post post = service.getPost(userId, post_id);
			Resource<Post> resource = new Resource<Post>(post);
			
			ControllerLinkBuilder linkto = linkTo(methodOn(getClass()).getPost(userId, post_id));
			Link link = linkto.withSelfRel();
			resource.add(link);
			return resource;
			
		}
		catch(Exception exp)
		{
			exp.printStackTrace();
			throw new PostNotFound("The post of id " + post_id + " having user id " + userId + " is not found");
		}
	}
	
	//read
	@GetMapping("{id}/posts")
	public List<Post> getPosts(@PathVariable("id") int id)
	{
		try
		{
			List<Post> posts = service.getPosts(id);
			return posts;
		}
		catch(Exception exp)
		{
			exp.printStackTrace();
			throw new PostNotFound("The post of user id " + id  + " are not found");			
		}		
	}
	
	//update
	//users/{id}/posts/
	@PutMapping("{id}/posts")
	public ResponseEntity<Void> updatePost(@PathVariable("id") int userId, @RequestBody Post post)
	{
		try
		{
			service.updatePost(userId, post);
			return ResponseEntity.status(HttpStatus.OK).build();
		}
		catch(Exception exp)
		{
			return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).build();
		}
	}
	
	@DeleteMapping("{id}/posts/{postId}")
	public ResponseEntity<Void> deletePost(@PathVariable("postId") int postId, @PathVariable("id") int id)
	{
		service.deletePost(id, postId);
		return ResponseEntity.status(HttpStatus.OK).build();
	}
}
