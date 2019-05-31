package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.CartInfoDAO;
import com.lovelacrosse.dao.PurchaseHistoryInfoDAO;
import com.lovelacrosse.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PaymentCompleteAction extends ActionSupport implements SessionAware{

	private int destinationId;
	private Map<String, Object> session;

	@Override
	public String execute() {

		String ret = ERROR;

		//30分以上経ってセッションが空の時はタイムアウト
		if(session.isEmpty()) {
			return "sessionTimeout";
		}

		String userId = String.valueOf(session.get("loginUserId"));

		@SuppressWarnings("unchecked" )
		List<CartInfoDTO> cartInfoDTOList = (List<CartInfoDTO>) session.get("cartInfoDTOList");
		PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();
		int count = 0;

		//購入履歴テーブルに情報を追加する（cartInfoDTOListがある分だけ）
		for(CartInfoDTO dto: cartInfoDTOList){
			count = count + purchaseHistoryInfoDAO.addPurchaseHistoryInfo(userId, dto.getProductId(), dto.getProductCount(),dto.getProductColor(), dto.getPrice() ,destinationId);
		}

		//カートテーブルの情報を削除する
		if(count > 0) {

			//TODO
			System.out.println("①");
			System.out.println(destinationId);

			CartInfoDAO cartInfoDAO = new CartInfoDAO();
			cartInfoDAO.deleteAllCartInfo(userId);

			System.out.println(count);

			ret = SUCCESS;
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

	public int getDestinationId() {
		return destinationId;
	}


	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}



}
