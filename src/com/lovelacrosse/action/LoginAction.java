package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.CartInfoDAO;
import com.lovelacrosse.dao.UserInfoDAO;
import com.lovelacrosse.dto.CartInfoDTO;
import com.lovelacrosse.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{

	private String loginUserId;
	private String password;
	private List<String> userIdErrorList;
	private List<String> passwordErrorList;
	private Map<String,Object>session;
	private List<CartInfoDTO> cartInfoDTOListPreLoggedIn;
	private String loginCheckErrorMessage;
	private boolean idHolder;

	private List<CartInfoDTO>  cartInfoDTOList;
	private int totalPrice;
	private String userId;
	private String holdedUserId;
	private boolean outcome;
	private int totalCount;



	//メインメソッド
	@Override
	public String execute() {

		String ret = ERROR;
		session.remove("myPageFlag");

		//未入力エラーのチェック
		InputChecker inputChecker = new InputChecker();

		userIdErrorList = inputChecker.doCheck("ユーザーID", loginUserId);
		passwordErrorList = inputChecker.doCheck("パスワード", password);

		if(userIdErrorList.size() > 0 || passwordErrorList.size() > 0){

			return ret;
		}

		//ユーザーID保持のチェック
		if(idHolder) {
			session.put("holdedUserId", loginUserId);
			session.put("idHolder", idHolder);
		}else{
			session.remove("holdedUserId");
			session.remove("idHolder");
		}

		//入力値とデータベースの情報が一致するかチェック
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		outcome = userInfoDAO.loginCheck(loginUserId, password);


		//ログイン後、仮ユーザーIDでデータベースに送ったカート情報を、ユーザーIDで紐づけられたカート情報に追加するメソッド
		CartInfoDAO cartInfoDAO = new CartInfoDAO();

		if(outcome) {
			cartInfoDTOListPreLoggedIn = cartInfoDAO.getUserCartInfo((String) session.get("temporaryUserId"));

			if(cartInfoDTOListPreLoggedIn != null) {
				changeCartInfo(cartInfoDTOListPreLoggedIn);
			}

			session.put("loginUserId", loginUserId);
			session.put("loginFlag", 1);

			if(session.containsKey("cartFlag")) {

				session.remove("cartFlag");
				session.put("loginUserId", loginUserId);
				session.put("loginFlag", 1);

				return  "goCart";
			}

			ret = SUCCESS;
			return ret;
		}else {

			setLoginCheckErrorMessage("ユーザーID、もしくはパスワードに誤りがあります。");
			return ret;
		}
	}


	//ログイン後、仮ユーザーIDでデータベースに送ったカート情報を、ユーザーIDで紐づけられたカート情報に追加するメソッド
	private boolean changeCartInfo(List<CartInfoDTO> cartInfoDTOListNotLoggedIn) {
		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		int count = 0;
		boolean ret = false;

		//TODO
		System.out.println("7ここまできてる？");
		System.out.println(session.get("temporaryUserId"));
		System.out.println("loginUserIdは"+loginUserId);

		String temporaryUserId = (session.get("temporaryUserId")).toString();


		//未ログイン時のカート情報に追加されていたそれぞれの商品でループ
		for(CartInfoDTO dto : cartInfoDTOListNotLoggedIn) {

			//ログイン時と未ログイン時で同じ商品をカートに入れていた場合：カート情報の個数を変更
			if(cartInfoDAO.checkSameCartItem(loginUserId, dto.getProductId(), dto.getProductColor())){

				//TODO
				System.out.println("？");

				count += cartInfoDAO.updateCartCount(loginUserId, dto.getProductId(), dto.getProductColor(), dto.getProductCount());
				cartInfoDAO.deleteCartInfo(temporaryUserId, dto.getProductId(), dto.getProductColor());

			//ログイン時と未ログイン時で同じ商品をカートに入れていなかった場合：カート情報のユーザーIDを変更
			}else {
				//TODO
				System.out.println("？??");
				count += cartInfoDAO.changeUserId(temporaryUserId, loginUserId, dto.getProductId(), dto.getProductCount());
			}
		}

		//TODO
		System.out.println("9ここまできてる？");

		//ユーザーIDごとのカート情報を取得し、合計金額を計算
		if(count == cartInfoDTOListNotLoggedIn.size()) {

			//TODO
			System.out.println("loginUserIdは"+loginUserId);


			cartInfoDTOList = cartInfoDAO.getUserCartInfo(loginUserId);
			totalPrice = cartInfoDAO.getTotalPrice(loginUserId);
			totalCount = cartInfoDAO.getTotalCount(loginUserId);
			ret = true;

			//TODO
			System.out.println("!!!");
			System.out.println(cartInfoDTOList.size());
			System.out.println(totalPrice);

		}
		return ret;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public List<String> getUserIdErrorList() {
		return userIdErrorList;
	}
	public void setUserIdErrorList(List<String> userIdErrorList) {
		this.userIdErrorList = userIdErrorList;
	}
	public List<String> getPasswordErrorList() {
		return passwordErrorList;
	}
	public void setPasswordErrorList(List<String> passwordErrorList) {
		this.passwordErrorList = passwordErrorList;
	}
	public List<CartInfoDTO> getCartInfoDTOListPreLoggedIn() {
		return cartInfoDTOListPreLoggedIn;
	}
	public void setCartInfoDTOListNotLoggedIn(List<CartInfoDTO> cartInfoDTOListPreLoggedIn) {
		this.cartInfoDTOListPreLoggedIn = cartInfoDTOListPreLoggedIn;
	}
	public String getLoginCheckErrorMessage() {
		return loginCheckErrorMessage;
	}
	public void setLoginCheckErrorMessage(String loginCheckErrorMessage) {
		this.loginCheckErrorMessage = loginCheckErrorMessage;
	}
	public List<CartInfoDTO> getCartInfoDTOList() {
		return cartInfoDTOList;
	}
	public void setCartInfoDTOList(List<CartInfoDTO> cartInfoDTOList) {
		this.cartInfoDTOList = cartInfoDTOList;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getLoginUserId() {
		return loginUserId;
	}
	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isIdHolder() {
		return idHolder;
	}
	public void setIdHolder(boolean idHolder) {
		this.idHolder = idHolder;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getHoldedUserId() {
		return holdedUserId;
	}

	public void setHoldedUserId(String holdedUserId) {
		this.holdedUserId = holdedUserId;
	}


	public boolean isOutcome() {
		return outcome;
	}


	public void setOutcome(boolean outcome) {
		this.outcome = outcome;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}
