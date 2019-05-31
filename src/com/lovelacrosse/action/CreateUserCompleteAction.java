package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class CreateUserCompleteAction extends ActionSupport implements SessionAware{

	private Map <String,Object> session;

	@Override
	public String execute() {

		String ret = ERROR;

		UserInfoDAO userInfoDAO = new UserInfoDAO();


		int count = userInfoDAO.addUserInfo(
				String.valueOf(session.get("familyName")),
				String.valueOf(session.get("firstName")),
				String.valueOf(session.get("familyNameKana")),
				String.valueOf(session.get("firstNameKana")),
				String.valueOf(session.get("sex")),
				String.valueOf(session.get("email")),
				String.valueOf(session.get("userId")),
				String.valueOf(session.get("password"))
			);

		if(count > 0) {
			ret = SUCCESS;
		}

		session.remove("familyName");
        session.remove("firstName");
        session.remove("familyNameKana");
        session.remove("firstNameKanas");
        session.remove("sex");
        session.remove("email");
        session.remove("userId");
        session.remove("password");

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
