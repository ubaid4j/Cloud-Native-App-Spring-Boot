package com.ubaid.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ubaid.app.entity.User;

@Repository
public interface UserJpaDAO extends JpaRepository<User, Integer>
{

}
