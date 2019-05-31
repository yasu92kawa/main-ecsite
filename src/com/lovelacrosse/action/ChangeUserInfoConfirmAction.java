package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class ChangeUserInfoConfirmAction extends ActionSupport implements SessionAware{

	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private String sex;
	private String email;

	private List<String> familyNameErrorList;
	private List<String> firstNameErrorList;
	private List<String> familyNameKanaErrorList;
	private List<String> firstNameKanaErrorList;
	private List<String> emailErrorList;

	private Map<String,Object> session;
	private String duplicateUserIdMessage;

	@Override
	public String execute() {

		String ret = ERROR;

		session.put("familyName",familyName);
		session.put("firstName",firstName);
		session.put("familyNameKana",familyNameKana);
		session.put("firstNameKana",firstNameKana);
		session.put("sex",sex);
		session.put("email",email);


		//空欄がないかチェック
		InputChecker inputChecker = new InputChecker();

		familyNameErrorList=inputChecker.doCheck("姓", familyName);
		firstNameErrorList=inputChecker.doCheck("名", firstName);
		familyNameKanaErrorList=inputChecker.doCheck("姓（かな）", familyNameKana);
		firstNameKanaErrorList=inputChecker.doCheck("名（かな）", firstNameKana);
		emailErrorList=inputChecker.doCheck("メールアドレス", email);


		if(familyNameErrorList.size() > 0
			|| firstNameErrorList.size() > 0
			|| familyNameKanaErrorList.size() > 0
			|| firstNameKanaErrorList.size() > 0
			|| emailErrorList.size() > 0){

			return ret;
		}

		ret=SUCCESS;

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


	public String getDuplicateUserIdMessage() {
		return duplicateUserIdMessage;
	}
	public void setDuplicateUserIdMessage(String duplicateUserIdMessage) {
		this.duplicateUserIdMessage = duplicateUserIdMessage;
	}


}
