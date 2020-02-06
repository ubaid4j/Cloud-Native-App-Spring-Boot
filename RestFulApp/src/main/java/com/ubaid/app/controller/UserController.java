package com.ubaid.app.controller;

import java.net.URI;
import java.util.List;

import javax.validation.Valid;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
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

import com.ubaid.app.entity.User;
import com.ubaid.app.exception.UserNotFoundException;
import com.ubaid.app.service.IUserService;
import com.ubaid.app.service.UserJPAService;

@RestController
@RequestMapping("/")
public class UserController
{
	@Autowired
	@Qualifier(value = "userService")
	private IUserService service;
	
	@Autowired
	@Qualifier(value = "userJPAService")
	private UserJPAService service2;
	
	@GetMapping("users")
	public List<User> getAllUsers()
	{
		return service2.findAll();
	}
	
	@GetMapping("users/{id_}")
	public EntityModel<User> getUser(@PathVariable(value = "id_") int id)
	{
		User user = null;
		try
		{
			user = service2.findOne(id);			
		}
		catch(Exception exp)
		{
			throw new UserNotFoundException("user of id " + id + " not found");
		}
		if(user != null)
		{
			EntityModel<User> resource = new EntityModel<User>(user);

			WebMvcLinkBuilder linkTo = linkTo(methodOn(this.getClass()).getAllUsers());
			resource.add(linkTo.withRel("all-users"));			
			return resource;			
		}
		else
			throw new UserNotFoundException(String.format("The user of id %d is not present", id));
	}
	
//	@GetMapping("users/{id_}")
//	public User getUser(@PathVariable(value = "id_") int id)
//	{
//		User user = service2.findOne(id);
//		if(user != null)
//			return user;
//		else
//			throw new UserNotFoundException(String.format("The user of id %d is not present", id));
//	}

	
	
	@PostMapping(value = "users")
	public ResponseEntity<Void> createUser(@Valid @RequestBody User user)
	{
		user = service2.save(user);
		
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
		
		User user = null;
		
		try
		{
			user = service2.delete(id);			
		}
		catch(Exception exp)
		{
			throw new UserNotFoundException("User of id " + id + " is not present"); 
		}

		
		if(user != null)
		{
			return ResponseEntity.ok().build();
		}
		else
		{
			throw new UserNotFoundException(String.format("The user of id %d is not found", id));
		}
		
	}
	
	@PutMapping("users")
	public EntityModel<User> update(@RequestBody User user)
	{
		try
		{
			user = service2.update(user);			
			EntityModel<User> response = new EntityModel<User>(user);
			WebMvcLinkBuilder linkto = linkTo(methodOn(getClass()).getUser(user.getId()));
			response.add(linkto.withRel("same-user"));
			return response;
		}
		catch(Exception exp)
		{
			throw new UserNotFoundException("The user of id " + user.getId() + " is not exists in the database");
		}
	}
}


