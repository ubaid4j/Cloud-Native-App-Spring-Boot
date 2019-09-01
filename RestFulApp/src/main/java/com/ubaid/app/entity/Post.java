package com.ubaid.app.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Here we are making post and user relation ship
 * it is one to many bidirectional relationship 
 * we can access user from his post and vice versa
 * so, we have to add instance of user in the Post
 * and we will annotate it using @JoinColumn 
 * 
 * ---------------------------------------------------------------
 * one user has many posts 
 * ---------------------------------------------------------------
 * 
 * @author UbaidurRehman
 *
 */


@Entity
@Table(name = "post")
public class Post
{
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "detail")
	private String detail;
	
	@JsonIgnore
	@ManyToOne(cascade = {
			CascadeType.PERSIST
	})
	@JoinColumn(name = "user_id")
	private User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post(String title, String detail, User user) {
		this.title = title;
		this.detail = detail;
		this.user = user;
	}

	public Post() {
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", detail=" + detail + ", user=" + user.getName() + "]";
	}
	
	
}
