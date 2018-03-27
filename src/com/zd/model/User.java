package com.zd.model;

import java.util.Date;

public class User {
	/*uid varchar(100) NOT NULL
	username varchar(50) NULL
	password varchar(50) NULL
	email varchar(100) NULL
	sex varchar(32) NULL
	telephone varchar(225) NULL
	udate date NULL*/
	private String uid;
	private String username;
	private String password;
	private String email;
	private String sex;
	private String telephone;
	private Date udate;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public User() {
		super();
	}
	
}
