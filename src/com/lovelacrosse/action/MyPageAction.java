package com.lovelacrosse.action;

import java.util.ArrayList;
import java.util.List;
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

public class MyPageAction extends ActionSupport implements SessionAware{


	private Map<String, Object> session;
	private List<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList;
	private ArrayList<DestinationInfoDTO> destinationInfoDTOList;
	private UserInfoDTO userInfoDTO = new UserInfoDTO();
	private String concealedPassword;

	@Override
	public String execute() {

		String ret = ERROR;

		//sessionがタイムアウトのチェック
		if(session.isEmpty()) {
			return "sessionTimeout";
		}

		//住所登録・削除後、myPageからの遷移を示すフラグ
		session.put("myPageFlag", 1);

		String userId = String.valueOf(session.get("loginUserId"));

		//登録住所を取得
		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
		destinationInfoDTOList = destinationInfoDAO.getDestinationInfoList(userId);

		//ユーザー情報を取得
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		userInfoDTO = userInfoDAO.getUserInfo(userId);

		CommonUtility commonUtil = new CommonUtility();
		concealedPassword = commonUtil.concealPassword(userInfoDTO.getPassword());

		//購入履歴を取得
		PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();
		purchaseHistoryInfoDTOList = purchaseHistoryInfoDAO.getPurchaseHistoryInfo(userId);


		ret = SUCCESS;

		return ret;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<PurchaseHistoryInfoDTO> getPurchaseHistoryInfoDTOList() {
		return purchaseHistoryInfoDTOList;
	}

	public void setPurchaseHistoryInfoDTOList(List<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList) {
		this.purchaseHistoryInfoDTOList = purchaseHistoryInfoDTOList;
	}

	public String getConcealedPassword() {
		return concealedPassword;
	}

	public void setConcealedPassword(String concealedPassword) {
		this.concealedPassword = concealedPassword;
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


}
