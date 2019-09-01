package com.ubaid.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ubaid.app.dao.PostJpaDAO;
import com.ubaid.app.entity.Post;
import com.ubaid.app.entity.User;
import com.ubaid.app.exception.PostNotFound;
import com.ubaid.app.exception.UserNotFoundException;

@Service
public class PostService implements IPostService
{

	@Autowired
	@Qualifier("userJPAService")
	private IUserService service;
	
	@Autowired
	@Qualifier("postJpaDAO")
	private PostJpaDAO dao;
	
	@Override
	public Post createPost(int userId, Post post)
	{
		User user = service.findOne(userId);
		if(user == null)
			throw new UserNotFoundException("The User of id " + userId + " is not found");
		user.addPost(post);
		post = dao.save(post);
		System.out.println(post.toString());
		return post;
	}

	@Transactional
	@Override
	public int deletePost(int userId, int postId)
	{
//		Post post = dao.findById(postId).get();
		int result = dao.deleteByIdAndUserId(postId, userId);
//		int result = 1;
//		dao.deleteById(postId);

		System.out.println("[Info]: Result: " + result);
		if(result > 0)
			return result;
		throw new PostNotFound("The post of id " + postId + " of user " + userId + " is not found");
	}

	@Override
	public Post updatePost(int userId, Post post)
	{
		User user = service.findOne(userId);
		post.setUser(user);
		return dao.save(post);
	}

	@Override
	public Post getPost(int userId, int postId)
	{
		Post post = dao.findByIdAndUserId(postId, userId);
		return post;
	}

	@Override
	public List<Post> getPosts(int userId)
	{
		return dao.findByUserId(userId);
	}

}
