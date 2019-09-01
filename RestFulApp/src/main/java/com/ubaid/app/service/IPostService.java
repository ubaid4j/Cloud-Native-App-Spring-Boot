package com.ubaid.app.service;

import java.util.List;

import com.ubaid.app.entity.Post;

public interface IPostService
{
	public Post createPost(int userId, Post post);
	public int deletePost(int userId, int postId);
	public Post updatePost(int userId, Post post);
	public Post getPost(int userId, int postId);
	public List<Post> getPosts(int userId);
}
