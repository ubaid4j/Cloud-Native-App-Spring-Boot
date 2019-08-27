package com.ubaid.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubaid.app.dao.UserDAO;
import com.ubaid.app.entity.User;

@Service
public class UserService implements IUserService
{

	@Autowired
	private UserDAO dao;
	
	@Override
	public List<User> findAll()
	{
		return dao.findAll();
	}

	@Override
	public User findOne(int id)
	{
		return dao.findOne(id);
	}

	@Override
	public User save(User user)
	{
		return dao.save(user);
	}

	@Override
	public User delete(int id)
	{
		return dao.delete(id);
	}
}
