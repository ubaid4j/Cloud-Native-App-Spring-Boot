package com.ubaid.app.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ubaid.app.entity.User;

@Repository
public class UserDAOImp implements UserDAO
{

	private static List<User> users = new ArrayList<User>();
	private static int counter = 0;
	
	static {
		users.add(new User(++counter, "Ubaid ur Rehman", new Date()));
		users.add(new User(++counter, "Attiq ur Rehman", new Date()));
		users.add(new User(++counter, "Shafiq ur Rehman", new Date()));	
	}
	
	@Override
	public List<User> findAll()
	{
		return users;
	}

	@Override
	public User findOne(int id)
	{
		for(User user : users)
		{
			if(user.getId() == id)
				return user;
		}
		return null;
	}

	@Override
	public User save(User user)
	{
		user.setId(++counter);
		if(users.add(user))
			return user;
		return null;
	}

	@Override
	public User delete(int id)
	{
		User user = findOne(id);
		if(user != null)
		{
			users.remove(user);
			return user;
		}
		return null;
	}
}
