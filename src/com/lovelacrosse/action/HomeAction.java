package com.lovelacrosse.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware{
	private Map<String, Object> session;

	@Override
	public String execute() {

		String ret = SUCCESS;

		//セッションに仮IDがない場合：session仮IDにランダムなIDを入れる
		if(!(session.containsKey("temporaryUserId"))) {
			CommonUtility commonUtil = new CommonUtility();
			session.put("temporaryUserId", commonUtil.getRamdomValue());
		}

		//セッションにログインIDがない場合：sessionログインIDに未ログインの印である0を入れる。
		if(!(session.containsKey("loginFlag"))){
			session.put("loginFlag", 0);
		}

		//TODO test
		System.out.print(ret);
		//TODO test

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
