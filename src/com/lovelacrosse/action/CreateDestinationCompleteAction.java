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

public class CreateDestinationCompleteAction extends ActionSupport implements SessionAware{

	private Map<String,Object>session;
	private List<DestinationInfoDTO> destinationInfoDTOList;
	private UserInfoDTO userInfoDTO;
	private String concealedPassword;
	private ArrayList<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList;

	@Override
	public String execute(){

		String ret = ERROR;
		String userId = String.valueOf(session.get("loginUserId"));

		if(session.isEmpty()){
			return "sessionTimeout";
		}

		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();

		int count = destinationInfoDAO.addDestinationInfo(
				String.valueOf(session.get("loginUserId")),
				String.valueOf(session.get("familyName")),
				String.valueOf(session.get("firstName")),
				String.valueOf(session.get("postalCode")),
				String.valueOf(session.get("prefectures")),
				String.valueOf(session.get("firstAddress")),
				String.valueOf(session.get("secondAddress")),
				String.valueOf(session.get("tel"))
			);

		if(count > 0) {
			destinationInfoDTOList = destinationInfoDAO.getDestinationInfoList(userId);
			ret = SUCCESS;
		}

		session.remove("familyName");
        session.remove("firstName");
        session.remove("postalCode");
        session.remove("prefectures");
        session.remove("firstAddress");
        session.remove("secondAddress");
        session.remove("tel");

        if(session.containsKey("myPageFlag")) {

        	//ユーザー情報を取得
			UserInfoDAO userInfoDAO = new UserInfoDAO();
			userInfoDTO = userInfoDAO.getUserInfo(userId);

			CommonUtility commonUtil = new CommonUtility();
			concealedPassword = commonUtil.concealPassword(userInfoDTO.getPassword());

			//購入履歴を取得
			PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();
			purchaseHistoryInfoDTOList = purchaseHistoryInfoDAO.getPurchaseHistoryInfo(userId);

        	ret = "goMyPage";
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

	public List<DestinationInfoDTO> getDestinationInfoDTOList() {
		return destinationInfoDTOList;
	}

	public void setDestinationInfoDTOList(List<DestinationInfoDTO> destinationInfoDTOList) {
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
