package com.ubaid.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubaid.app.dao.UserJpaDAO;
import com.ubaid.app.entity.User;
import com.ubaid.app.exception.UserNotFoundException;

@Service
public class UserJPAService implements IUserService
{

	@Autowired
	private UserJpaDAO dao;
	
	@Override
	public List<User> findAll()
	{
		return dao.findAll();
	}

	@Override
	public User findOne(int id)
	{
		return dao.findById(id).get();
	}

	@Override
	public User save(User user)
	{
		return dao.save(user);
	}

	@Override
	public User delete(int id)
	{
		User user = findOne(id);
		dao.delete(user);
		return user;
	}

	@Override
	public User update(User user)
	{
		System.out.println(dao.existsById(user.getId()));
		if(dao.existsById(user.getId()))
			return dao.save(user);
		throw new UserNotFoundException("User of id " + user.getId() + " is not present");
	}

}
