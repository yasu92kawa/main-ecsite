package com.lovelacrosse.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.DestinationInfoDAO;
import com.lovelacrosse.dao.PurchaseHistoryInfoDAO;
import com.lovelacrosse.dao.UserInfoDAO;
import com.lovelacrosse.dto.DestinationInfoDTO;
import com.lovelacrosse.dto.PurchaseHistoryInfoDTO;
import com.lovelacrosse.dto.UserInfoDTO;
import com.lovelacrosse.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteDestinationAction extends ActionSupport implements SessionAware{

	private int destinationId;
	private Map<String,Object>session;
	private ArrayList<DestinationInfoDTO> destinationInfoDTOList;
	private UserInfoDTO userInfoDTO;
	private String concealedPassword;
	private ArrayList<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList;

	@Override
	public String execute(){

		String ret = ERROR;
		String userId = String.valueOf(session.get("loginUserId"));

		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
		int count = 0;

		count = destinationInfoDAO.deleteDestinationInfo(destinationId);

		if(count > 0) {
			destinationInfoDTOList = destinationInfoDAO.getDestinationInfoList(userId);
			ret = "payment";
		}

		if(session.containsKey("myPageFlag")) {

			//ユーザー情報を取得
			UserInfoDAO userInfoDAO = new UserInfoDAO();
			userInfoDTO = userInfoDAO.getUserInfo(userId);

			CommonUtility commonUtil = new CommonUtility();
			concealedPassword = commonUtil.concealPassword(userInfoDTO.getPassword());

			//購入履歴を取得
			PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();
			purchaseHistoryInfoDTOList = purchaseHistoryInfoDAO.getPurchaseHistoryInfo(userId);


			ret = "mypage";
		}

		//TODO
		System.out.println("①");
		System.out.println(destinationInfoDTOList.size());

		return ret;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Object getSession() {
		return session;
	}

	public ArrayList<DestinationInfoDTO> getDestinationInfoDTOList() {
		return destinationInfoDTOList;
	}

	public void setDestinationInfoDTOList(ArrayList<DestinationInfoDTO> destinationInfoDTOList) {
		this.destinationInfoDTOList = destinationInfoDTOList;
	}

	public UserInfoDTO getUserInfoDTO() {
		return userInfoDTO;
	}

	public void setUserInfoDTO(UserInfoDTO userInfoDTO) {
		this.userInfoDTO = userInfoDTO;
	}

	public String getConcealedPassword() {
		return concealedPassword;
	}

	public void setConcealedPassword(String concealedPassword) {
		this.concealedPassword = concealedPassword;
	}

	public ArrayList<PurchaseHistoryInfoDTO> getPurchaseHistoryInfoDTOList() {
		return purchaseHistoryInfoDTOList;
	}

	public void setPurchaseHistoryInfoDTOList(ArrayList<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList) {
		this.purchaseHistoryInfoDTOList = purchaseHistoryInfoDTOList;
	}

}
