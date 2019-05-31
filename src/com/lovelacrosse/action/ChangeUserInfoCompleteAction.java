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

public class ChangeUserInfoCompleteAction extends ActionSupport implements SessionAware{

	private Map <String,Object> session;
	private ArrayList<DestinationInfoDTO> destinationInfoDTOList;
	private UserInfoDTO userInfoDTO;
	private String concealedPassword;
	private ArrayList<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList;

	@Override
	public String execute() {

		String ret = ERROR;

		String userId = String.valueOf(session.get("loginUserId"));
		UserInfoDAO userInfoDAO = new UserInfoDAO();

		int count = userInfoDAO.changeUserInfo(
				String.valueOf(session.get("loginUserId")),
				String.valueOf(session.get("familyName")),
				String.valueOf(session.get("firstName")),
				String.valueOf(session.get("familyNameKana")),
				String.valueOf(session.get("firstNameKana")),
				String.valueOf(session.get("sex")),
				String.valueOf(session.get("email"))
			);

		if(count > 0) {
			ret = SUCCESS;
		}

		session.remove("familyName");
        session.remove("firstName");
        session.remove("familyNameKana");
        session.remove("firstNameKanas");
        session.remove("sex");
        session.remove("email");

        //登録住所を取得
  		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
  		destinationInfoDTOList = destinationInfoDAO.getDestinationInfoList(userId);

  		//ユーザー情報を取得
  		userInfoDTO = userInfoDAO.getUserInfo(userId);

  		CommonUtility commonUtil = new CommonUtility();
  		concealedPassword = commonUtil.concealPassword(userInfoDTO.getPassword());

  		//購入履歴を取得
  		PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();
  		purchaseHistoryInfoDTOList = purchaseHistoryInfoDAO.getPurchaseHistoryInfo(userId);

        return ret;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
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
