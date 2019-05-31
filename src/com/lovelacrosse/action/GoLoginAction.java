package com.lovelacrosse.action;


import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class GoLoginAction extends ActionSupport implements SessionAware{
	private Map<String, Object> session;

	@Override
	public String execute() {

		//なんだこれ？？？？
		session.remove("cartFlag");

		String ret = SUCCESS;
		return ret;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}

