package com.lovelacrosse.action;


import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.CartInfoDAO;
import com.lovelacrosse.dao.DestinationInfoDAO;
import com.lovelacrosse.dto.CartInfoDTO;
import com.lovelacrosse.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PaymentConfirmAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private int destinationId;
	private List<DestinationInfoDTO> choosenDestinationInfoDTOList;
	private List<CartInfoDTO> cartInfoDTOList;
	private int totalPrice;

	@Override
	public String execute() {

		String ret = ERROR;

		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
		choosenDestinationInfoDTOList = destinationInfoDAO.getDestinationInfo(destinationId);

		//TODO
		System.out.println("①");
		System.out.println(destinationId);

		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		String userId = String.valueOf(session.get("loginUserId"));

		//カートの情報をセッションに格納して次の画面に渡す・（なくてもいいかもしれない）
		cartInfoDTOList = cartInfoDAO.getUserCartInfo(userId);
		totalPrice = cartInfoDAO.getTotalPrice(userId);
		session.put("cartInfoDTOList", cartInfoDTOList);

		ret = SUCCESS;

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

	public List<DestinationInfoDTO> getChoosenDestinationInfoDTOList() {
		return choosenDestinationInfoDTOList;
	}

	public void setChoosenDestinationInfoDTOList(List<DestinationInfoDTO> choosenDestinationInfoDTOList) {
		this.choosenDestinationInfoDTOList = choosenDestinationInfoDTOList;
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


}


