package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class CreateDestinationConfirmAction extends ActionSupport implements SessionAware{

	private String familyName;
	private String firstName;
	private String postalCode;
	private String prefectures;
	private String firstAddress;
	private String secondAddress;
	private String tel;

   //inputCheckerの戻り値を格納
	private List<String> familyNameErrorList;
	private List<String> firstNameErrorList;
	private List<String> postalCodeErrorList;
	private List<String> prefecturesErrorList;
	private List<String> firstAddressErrorList;
	private List<String> secondAddressErrorList;
	private List<String> telErrorList;

	private Map<String,Object>session;

	@Override
	public String execute() {
		String ret = ERROR;

		session.put("familyName", familyName);
		session.put("firstName", firstName);
		session.put("postalCode", postalCode);
		session.put("prefectures", prefectures);
		session.put("firstAddress", firstAddress);
		session.put("secondAddress", secondAddress);
		session.put("tel", tel);

		//未記入のチェック
		InputChecker inputChecker = new InputChecker();

		familyNameErrorList=inputChecker.doCheck("姓", familyName);
		firstNameErrorList=inputChecker.doCheck("名", firstName);
		postalCodeErrorList=inputChecker.doCheck("郵便番号", postalCode);
		firstAddressErrorList=inputChecker.doCheck("市町村", firstAddress);
		secondAddressErrorList=inputChecker.doCheck("丁・番地・マンション", secondAddress);
		telErrorList=inputChecker.doCheck("電話番号", tel);

		//TODO
				System.out.println("②");
				System.out.println(secondAddressErrorList.size());
				System.out.println(firstAddressErrorList.size());
				System.out.println(telErrorList.size());


		if(familyNameErrorList.size() > 0
				|| firstNameErrorList.size() > 0
				|| postalCodeErrorList.size() > 0
				|| firstAddressErrorList.size() > 0
				|| telErrorList.size() > 0
				|| secondAddressErrorList.size() > 0)
		{
			ret = ERROR;
		}else{
			ret=SUCCESS;
		}




		return ret;
	}

	public List<String> getPostalCodeErrorList() {
		return postalCodeErrorList;
	}
	public void setPostalCodeErrorList(List<String> postalCodeErrorList) {
		this.postalCodeErrorList = postalCodeErrorList;
	}
	public List<String> getFirstAddressErrorList() {
		return firstAddressErrorList;
	}
	public void setFirstAddressErrorList(List<String> firstAddressErrorList) {
		this.firstAddressErrorList = firstAddressErrorList;
	}
	public List<String> getSecondAddressErrorList() {
		return secondAddressErrorList;
	}
	public void setSecondAddressErrorList(List<String> secondAddressErrorList) {
		this.secondAddressErrorList = secondAddressErrorList;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		// TODO 自動生成されたメソッド・スタブ
	}
	public Map<String, Object> getSession() {
		return session;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public List<String> getTelErrorList() {
		return telErrorList;
	}

	public void setTelErrorList(List<String> telErrorList) {
		this.telErrorList = telErrorList;
	}

	public String getPrefectures() {
		return prefectures;
	}

	public void setPrefectures(String prefectures) {
		this.prefectures = prefectures;
	}

	public List<String> getPrefecturesErrorList() {
		return prefecturesErrorList;
	}

	public void setPrefecturesErrorList(List<String> prefecturesErrorList) {
		this.prefecturesErrorList = prefecturesErrorList;
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

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getFirstAddress() {
		return firstAddress;
	}

	public void setFirstAddress(String firstAddress) {
		this.firstAddress = firstAddress;
	}

	public String getSecondAddress() {
		return secondAddress;
	}

	public void setSecondAddress(String secondAddress) {
		this.secondAddress = secondAddress;
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

}
