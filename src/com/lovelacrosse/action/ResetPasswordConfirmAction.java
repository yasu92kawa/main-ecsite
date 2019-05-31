package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.UserInfoDAO;
import com.lovelacrosse.util.CommonUtility;
import com.lovelacrosse.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordConfirmAction extends ActionSupport implements SessionAware{

	private String userId;
	private String currentPassword;
	private String newPassword;
	private String confirmNewPassword;
	private String concealedPassword;

	private List<String> userIdErrorList;
	private List<String> currentPasswordErrorList;
	private List<String> newPasswordErrorList;
	private String duplicateUserIdMessage;
	private String passwordMismatchingMessage;

	private Map<String,Object> session;
	private String notMatchMessage;


	@Override
	public String execute() {

		String ret = ERROR;

		session.put("newPassword", newPassword);
		session.put("userId", userId);

		//空欄がないかチェック
		InputChecker inputChecker = new InputChecker();

		userIdErrorList=inputChecker.doCheck("ユーザーID", userId);
		currentPasswordErrorList=inputChecker.doCheck("現在のパスワード", currentPassword);
		newPasswordErrorList=inputChecker.doCheck("新しいパスワード", newPassword);

		if(userIdErrorList.size() > 0
			|| currentPasswordErrorList.size() > 0
			|| newPasswordErrorList.size() > 0){
			return ret;
		}

		//ユーザーID・確認用パスワードの不一致をチェック
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		boolean userIdPasswordCheck = userInfoDAO.checkUserIdPasswordInfo(userId, currentPassword);
		boolean passwordCheck = inputChecker.doPasswordCheck(newPassword, confirmNewPassword);

		if(userIdPasswordCheck){
			notMatchMessage = "ユーザーIDもしくはパスワードが不一致です";
			ret=ERROR;
		}
		else if(passwordCheck){
			passwordMismatchingMessage = "確認パスワードが一致しません";
			ret=ERROR;
		}

		else{
			CommonUtility commonUtil = new CommonUtility();
			concealedPassword = commonUtil.concealPassword(newPassword);
			ret=SUCCESS;
		}

		return ret;
	}


	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<String> getUserIdErrorList() {
		return userIdErrorList;
	}
	public void setUserIdErrorList(List<String> userIdErrorList) {
		this.userIdErrorList = userIdErrorList;
	}

	public String getDuplicateUserIdMessage() {
		return duplicateUserIdMessage;
	}
	public void setDuplicateUserIdMessage(String duplicateUserIdMessage) {
		this.duplicateUserIdMessage = duplicateUserIdMessage;
	}
	public String getConcealedPassword() {
		return concealedPassword;
	}
	public void setConcealedPassword(String concealedPassword) {
		this.concealedPassword = concealedPassword;
	}
	public String getPasswordMismatchingMessage() {
		return passwordMismatchingMessage;
	}
	public void setPasswordMismatchingMessage(String passwordMismatchingMessage) {
		this.passwordMismatchingMessage = passwordMismatchingMessage;
	}

	public String getCurrentPassword() {
		return currentPassword;
	}


	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}


	public String getNewPassword() {
		return newPassword;
	}


	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}


	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}


	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}


	public List<String> getCurrentPasswordErrorList() {
		return currentPasswordErrorList;
	}


	public void setCurrentPasswordErrorList(List<String> currentPasswordErrorList) {
		this.currentPasswordErrorList = currentPasswordErrorList;
	}


	public List<String> getNewPasswordErrorList() {
		return newPasswordErrorList;
	}


	public void setNewPasswordErrorList(List<String> newPasswordErrorList) {
		this.newPasswordErrorList = newPasswordErrorList;
	}


	public String getNotMatchMessage() {
		return notMatchMessage;
	}


	public void setNotMatchMessage(String notMatchMessage) {
		this.notMatchMessage = notMatchMessage;
	}

}