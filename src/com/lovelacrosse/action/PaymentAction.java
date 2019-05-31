package com.lovelacrosse.action;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.CartInfoDAO;
import com.lovelacrosse.dao.DestinationInfoDAO;
import com.lovelacrosse.dto.CartInfoDTO;
import com.lovelacrosse.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PaymentAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private String userId;
	private List<DestinationInfoDTO> destinationInfoDTOList;

	@Override
	public String execute() {

		String ret = ERROR;

		session.remove("myPageFlag");

		//ログイン・未ログイン時の判別
		if(session.containsKey("loginUserId")) {
			userId = String.valueOf(session.get("loginUserId"));
		} else {
			userId = String.valueOf(session.get("temporaryUserId"));
		}

		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		List<CartInfoDTO> cartInfoDTOList = new ArrayList<CartInfoDTO>();

		//カートの情報をセッションに格納
		cartInfoDTOList = cartInfoDAO.getUserCartInfo(userId);
		session.put("cartInfoDTOList", cartInfoDTOList);

		//ログイン・未ログインをチェック済みかチェック
		//未ログインならログイン画面へ遷移
		if(!session.get("loginFlag").equals(1)) {

			//未ログインの場合・カート画面からの遷移を示すフラグを追加
			session.put("cartFlag", 1);
			ret = "notLoggedIn";

			//ログインの場合・宛先住所を取得
		} else {

			DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
			destinationInfoDTOList = destinationInfoDAO.getDestinationInfoList(userId);

			ret = SUCCESS;
		}

		return ret;
		}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<DestinationInfoDTO> getDestinationInfoDTOList() {
		return destinationInfoDTOList;
	}
	public void setDestinationInfoDTOList(List<DestinationInfoDTO> destinationInfoDTOList) {
		this.destinationInfoDTOList = destinationInfoDTOList;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}


