package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.ContactInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ContactCompleteAction extends ActionSupport implements SessionAware{

	private Map<String,Object>session;

	@Override
	public String execute(){

		String ret = ERROR;

		if(session.isEmpty()){
			return "sessionTimeout";
		}

		ContactInfoDAO contactInfoDAO = new ContactInfoDAO();

		int count = contactInfoDAO.addContactInfo(
				String.valueOf(session.get("name")),
				String.valueOf(session.get("email")),
				String.valueOf(session.get("title")),
				String.valueOf(session.get("comments"))
			);

		if(count > 0) {
			ret = SUCCESS;
		}

		session.remove("name");
        session.remove("email");
        session.remove("title");
        session.remove("comments");

        return ret;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}

}
