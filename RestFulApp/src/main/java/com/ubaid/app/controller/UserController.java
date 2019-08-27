package com.ubaid.app.controller;

import java.net.URI;
import java.util.List;

import javax.validation.Valid;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.ubaid.app.entity.User;
import com.ubaid.app.exception.UserNotFoundException;
import com.ubaid.app.service.IUserService;

@RestController
@RequestMapping("/")
public class UserController
{
	@Autowired
	private IUserService service;
	
	@GetMapping("users")
	public List<User> getAllUsers()
	{
		return service.findAll();
	}
	
	@GetMapping("users/{id_}")
	public Resource<User> getUser(@PathVariable(value = "id_") int id)
	{
		User user = service.findOne(id);
		if(user != null)
		{
			Resource<User> resource = new Resource<User>(user);

			ControllerLinkBuilder linkTo = linkTo(methodOn(this.getClass()).getAllUsers());
			resource.add(linkTo.withRel("all-users"));			
			return resource;			
		}
		else
			throw new UserNotFoundException(String.format("The user of id %d is not present", id));
	}
	
//	@GetMapping("users/{id_}")
//	public User getUser(@PathVariable(value = "id_") int id)
//	{
//		User user = service.findOne(id);
//		if(user != null)
//			return user;
//		else
//			throw new UserNotFoundException(String.format("The user of id %d is not present", id));
//	}

	
	
	@PostMapping(value = "users")
	public ResponseEntity<Void> createUser(@Valid @RequestBody User user)
	{
		user = service.save(user);
		
		if(user != null)
		{
			URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(user.getId()).toUri();
			return ResponseEntity.created(uri).build();
		}
		
		return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).build();
	}
	
	@DeleteMapping(value = "users/{hereIsMyId}")
	public ResponseEntity<Void> deleteUser(@PathVariable(value = "hereIsMyId") int id)
	{
		User user = service.delete(id);
		if(user != null)
		{
			return ResponseEntity.ok().build();
		}
		else
		{
			throw new UserNotFoundException(String.format("The user of id %d is not found", id));
		}
		
	}
}


