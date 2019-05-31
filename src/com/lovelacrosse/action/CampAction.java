package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class CampAction extends ActionSupport implements SessionAware{


	private Map<String, Object> session;
	@Override
	public String execute() {

		String ret = SUCCESS;
		System.out.println(ret);
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
