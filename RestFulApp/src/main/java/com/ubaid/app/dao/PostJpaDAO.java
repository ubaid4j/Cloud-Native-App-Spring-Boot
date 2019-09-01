package com.ubaid.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ubaid.app.entity.Post;

@Repository
public interface PostJpaDAO extends JpaRepository<Post, Integer>
{
	Post findByIdAndUserId(int id, int userId);
	List<Post> findByUserId(int userId);
	
	int deleteByIdAndUserId(Integer id, Integer userId);	
}
