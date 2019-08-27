package com.ubaid.app.service;

import java.util.List;

import com.ubaid.app.entity.User;

public interface IUserService
{
	public List<User> findAll();
	public User findOne(int id);
	public User save(User user);
	public User delete(int id);
}
