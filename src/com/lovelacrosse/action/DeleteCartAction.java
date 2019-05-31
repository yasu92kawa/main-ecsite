package com.lovelacrosse.action;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import  com.lovelacrosse.dao.CartInfoDAO;
import  com.lovelacrosse.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteCartAction  extends ActionSupport implements SessionAware{

		private Map<String, Object> session;
		private String productId;
		private int totalPrice;
		private Collection<String> checkList;
		private ArrayList<CartInfoDTO> cartInfoDTOList;
		private int totalCount;

		@Override
		public String execute() throws SQLException{

			String ret = ERROR;
			String userId = null;

			//３０分以上経ってセッションが空の時はタイムアウトを返す
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
			int count = 0;

			//TODO
			System.out.println("①");
			System.out.println(productId);
			System.out.println(userId);

			//商品の削除を実行
				count = count + cartInfoDAO.deleteCartInfo(userId, productId);

			//TODO
			System.out.println("②");
			System.out.println("count"+count);

			//カート情報の取得、合計金額を取得して再度カート画面へ
			cartInfoDTOList = cartInfoDAO.getUserCartInfo(userId);
			totalPrice = cartInfoDAO.getTotalPrice(userId);
			setTotalCount(cartInfoDAO.getTotalCount(userId));

			ret = SUCCESS;

			return ret;
		}

		@Override
		public void setSession(Map<String, Object> session) {
			this.session=session;
		}

		public ArrayList<CartInfoDTO> getCartInfoList() {
			return getCartInfoList();
		}

		public List<CartInfoDTO> getCartInfoDTOList() {
			return cartInfoDTOList;
		}

		public void setCartInfoDTOList(List<CartInfoDTO> cartInfoDTOList) {
			this.cartInfoDTOList = (ArrayList<CartInfoDTO>) cartInfoDTOList;
		}

		public int getTotalPrice() {
			return totalPrice;
		}

		public void setTotalPrice(int totalPrice) {
			this.totalPrice = totalPrice;
		}

		public Collection<String> getCheckList() {
			return checkList;
		}

		public void setCheckList(Collection<String> checkList) {
			this.checkList = checkList;
		}

		public Map<String, Object> getSession() {
			return session;
		}

		public void setCartInfoDTOList(ArrayList<CartInfoDTO> cartInfoDTOList) {
			this.cartInfoDTOList = cartInfoDTOList;
		}

		public String getProductId() {
			return productId;
		}

		public void setProductId(String productId) {
			this.productId = productId;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
	}