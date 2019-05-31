package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.UserInfoDAO;
import com.lovelacrosse.util.CommonUtility;
import com.lovelacrosse.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class CreateUserConfirmAction extends ActionSupport implements SessionAware{

	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private String sex;
	private String email;
	private String userId;
	private String rePassword;
	private String password;
	private String concealedPassword;

	private List<String> familyNameErrorList;
	private List<String> firstNameErrorList;
	private List<String> familyNameKanaErrorList;
	private List<String> firstNameKanaErrorList;
	private List<String> emailErrorList;
	private List<String> userIdErrorList;
	private List<String> passwordErrorList;
	private String duplicateUserIdMessage;
	private String passwordMismatchingMessage;

	private Map<String,Object> session;

	@Override
	public String execute() {

		String ret = ERROR;

		session.put("familyName",familyName);
		session.put("firstName",firstName);
		session.put("familyNameKana",familyNameKana);
		session.put("firstNameKana",firstNameKana);
		session.put("sex",sex);
		session.put("email",email);
		session.put("userId",userId);
		session.put("password",password);

		//空欄がないかチェック
		InputChecker inputChecker = new InputChecker();

		familyNameErrorList=inputChecker.doCheck("姓", familyName);
		firstNameErrorList=inputChecker.doCheck("名", firstName);
		familyNameKanaErrorList=inputChecker.doCheck("姓（かな）", familyNameKana);
		firstNameKanaErrorList=inputChecker.doCheck("名（かな）", firstNameKana);
		emailErrorList=inputChecker.doCheck("メールアドレス", email);
		userIdErrorList=inputChecker.doCheck("ユーザーID", userId);
		passwordErrorList=inputChecker.doCheck("パスワード", password);

		if(familyNameErrorList.size() > 0
			|| firstNameErrorList.size() > 0
			|| familyNameKanaErrorList.size() > 0
			|| firstNameKanaErrorList.size() > 0
			|| emailErrorList.size() > 0
			|| userIdErrorList.size() > 0
			|| passwordErrorList.size() > 0){

			return ret;
		}

		//ユーザーIDの重複・確認用パスワードの不一致をチェック
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		boolean userIdCheck = userInfoDAO.checkUserIdInfo(userId);
		boolean passwordCheck = inputChecker.doPasswordCheck(password, rePassword);

		if(userIdCheck){
			duplicateUserIdMessage = "既に存在しているため使えないユーザーIDです。";
			ret=ERROR;
		}
		else if(passwordCheck){
			passwordMismatchingMessage = "確認パスワードが一致しません";
			ret=ERROR;
		}

		else{
			CommonUtility commonUtil = new CommonUtility();
			setConcealedPassword(commonUtil.concealPassword(password));
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
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getFamilyNameKana() {
		return familyNameKana;
	}
	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}
	public String getFirstNameKana() {
		return firstNameKana;
	}
	public void setFirstNameKana(String firstNameKana) {
		this.firstNameKana = firstNameKana;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<String> getFamilyNameErrorList() {
		return familyNameErrorList;
	}
	public void setFamilyNameErrorList(List<String> familyNameErrorList) {
		this.familyNameErrorList = familyNameErrorList;
	}
	public List<String> getFirstNameErrorList() {
		return firstNameErrorList;
	}
	public void setFirstNameErrorList(List<String> firstNameErrorList) {
		this.firstNameErrorList = firstNameErrorList;
	}
	public List<String> getFamilyNameKanaErrorList() {
		return familyNameKanaErrorList;
	}
	public void setFamilyNameKanaErrorList(List<String> familyNameKanaErrorList) {
		this.familyNameKanaErrorList = familyNameKanaErrorList;
	}
	public List<String> getFirstNameKanaErrorList() {
		return firstNameKanaErrorList;
	}
	public void setFirstNameKanaErrorList(List<String> firstNameKanaErrorList) {
		this.firstNameKanaErrorList = firstNameKanaErrorList;
	}
	public List<String> getEmailErrorList() {
		return emailErrorList;
	}
	public void setEmailErrorList(List<String> emailErrorList) {
		this.emailErrorList = emailErrorList;
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


	public String getRePassword() {
		return rePassword;
	}


	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

}
