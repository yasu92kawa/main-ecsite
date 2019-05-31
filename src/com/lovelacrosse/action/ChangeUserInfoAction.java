package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.UserInfoDAO;
import com.lovelacrosse.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ChangeUserInfoAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	private UserInfoDTO userInfoDTO = new UserInfoDTO();

	@Override
	public String execute() {

		String ret = SUCCESS;
		String userId = String.valueOf(session.get("loginUserId"));

		//ユーザー情報を取得
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		userInfoDTO = userInfoDAO.getUserInfo(userId);

		return ret;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public UserInfoDTO getUserInfoDTO() {
		return userInfoDTO;
	}

	public void setUserInfoDTO(UserInfoDTO userInfoDTO) {
		this.userInfoDTO = userInfoDTO;
	}
}
