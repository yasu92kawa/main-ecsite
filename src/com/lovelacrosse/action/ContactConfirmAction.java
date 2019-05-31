package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ContactConfirmAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;
	private String name;
	private String email;
	private String title;
	private String comments;

	@Override
	public String execute() {

		String ret = SUCCESS;

		session.put("name", name);
		session.put("email", email);
		session.put("title", title);
		session.put("comments", comments);

		return ret;
	}


	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public Map<String, Object> getSession() {
		return session;
	}

}