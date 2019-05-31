package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;

	@Override
	public String execute(){

		String holdedUserId = String.valueOf(session.get("holdedUserId"));
		boolean idHolder = Boolean.valueOf(String.valueOf(session.get("idHolder")));

		session.clear();

		//セッションを消去した後もユーザー保持にチェックが入っていた場合は、チェックとユーザーIDを保持する
		if(idHolder){
			session.put("idHolder", idHolder);
			session.put("holdedUserId", holdedUserId);
		}

		//ログアウト時に仮ユーザーIDを与える
		CommonUtility commonUtil = new CommonUtility();
		session.put("temporaryUserId", commonUtil.getRamdomValue());
		session.put("loginFlag", 0);

		return SUCCESS;
	}

	public Map<String, Object> getSession(){
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}
