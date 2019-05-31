package com.lovelacrosse.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.CartInfoDAO;
import com.lovelacrosse.dto.CartInfoDTO;
//import  com.lovelacrosse.dao.CartInfoDAO;
//import  com.lovelacrosse.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction  extends ActionSupport implements SessionAware{

		private Map<String, Object> session;
		private String userId;
		private int totalPrice;
		private ArrayList<CartInfoDTO> cartInfoDTOList;
		private int totalCount;

		@Override
		public String execute(){

			//30分以上経ってセッションが空の時はタイムアウト
			if(session.isEmpty()) {
				return "sessionTimeout";
			}

			//ログイン・未ログイン時の判別
			if(session.containsKey("loginUserId")) {
				userId = String.valueOf(session.get("loginUserId"));
			} else if(session.containsKey("temporaryUserId")){
				userId = String.valueOf(session.get("temporaryUserId"));
			}

			CartInfoDAO cartInfoDAO = new CartInfoDAO();

			//ユーザーIDごとのカート情報を取得し、合計金額を計算
				cartInfoDTOList = cartInfoDAO.getUserCartInfo(userId);
				totalPrice = cartInfoDAO.getTotalPrice(userId);
				totalCount = cartInfoDAO.getTotalCount(userId);

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
		public List<CartInfoDTO> getCartInfoDTOList() {
			return cartInfoDTOList;
		}
		public void setCartInfoDTOList(List<CartInfoDTO> cartInfoDTOList) {
			this.cartInfoDTOList = (ArrayList<CartInfoDTO>) cartInfoDTOList;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public int getTotalPrice() {
			return totalPrice;
		}
		public void setTotalPrice(int totalPrice) {
			this.totalPrice = totalPrice;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}

	}




