package com.lovelacrosse.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.CartInfoDAO;
import com.lovelacrosse.dao.ProductInfoDAO;
import com.lovelacrosse.dto.CartInfoDTO;
import com.lovelacrosse.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;



public class AddCartAction  extends ActionSupport implements SessionAware{

		private Map<String, Object> session;


		private int productId;
		private int productCount;
		private String productColor;


		private int productPrice;
		private int totalPrice;
		private int totalCount;
		private ArrayList<CartInfoDTO> cartInfoDTOList;

		@Override
		public String execute() throws SQLException{

			String ret = ERROR;

			//30分以上経ってセッションが空の時はタイムアウト
			if(session.isEmpty()) {
				return "sessionTimeout";
			}

			//ログイン・未ログイン時の判別
			String userId = null;
			if(session.containsKey("loginUserId")) {
				userId = String.valueOf(session.get("loginUserId"));
			} else if(session.containsKey("temporaryUserId")){
				userId = String.valueOf(session.get("temporaryUserId"));
			}

			CartInfoDAO cartInfoDAO = new CartInfoDAO();
			int count =0;
			ProductInfoDAO productInfoDAO = new ProductInfoDAO();
			ProductInfoDTO productInfoDTO = productInfoDAO.getProductInfoByProductId(productId);

			//カート追加しようとした商品がすでにカートにあるかをチェック
			if(cartInfoDAO.checkSameCartItem(userId, productId, productColor)){
				//存在する場合は商品の個数を更新する
				count = cartInfoDAO.updateCartCount(userId, productId, productColor, productCount);
			}else{
				//存在しない場合は商品を登録する(productPriceはJSPから取得)
				count = cartInfoDAO.addCartInfo(userId, productId, productColor, productCount, productInfoDTO.getPrice());
			}

			//ユーザーIDごとのカート情報を取得し、合計金額を計算
			if(count>0){
				cartInfoDTOList = cartInfoDAO.getUserCartInfo(userId);
				totalPrice = cartInfoDAO.getTotalPrice(userId);
				totalCount = cartInfoDAO.getTotalCount(userId);

				ret = SUCCESS;
			}
			return ret;
		}

		@Override
		public void setSession(Map<String, Object> session) {
			this.session=session;
		}
		public Map<String, Object> getSession() {
			return session;
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
		public int getProductCount() {
			return productCount;
		}
		public void setProductCount(int productCount) {
			this.productCount = productCount;
		}
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public String getProductColor() {
			return productColor;
		}

		public void setProductColor(String productColor) {
			this.productColor = productColor;
		}
	}


