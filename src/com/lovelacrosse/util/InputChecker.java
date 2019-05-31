package com.lovelacrosse.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils
;
public class InputChecker {

	/**
	 * @param propertyName 項目名
	 * @param value 値
	 * @return エラーメッセージのリスト
	 */

	//入力欄が空欄かどうかをチェックするメソッド
	public List<String> doCheck(String propertyName,String value){

		List<String> stringList = new ArrayList<String>();

		if(StringUtils.isEmpty(value)){
			stringList.add(propertyName + "を入力してください");
		}
		return stringList;
	}

	//電話番号用・入力欄が空欄かどうかをチェックするメソッド
		public List<String> doCheck(String propertyName,CharSequence value){

			List<String> stringList = new ArrayList<String>();

			if(StringUtils.isEmpty(value)){
				stringList.add(propertyName + "を入力してください");
			}
			return stringList;
		}

	//パスワードと確認パスワードの一致・不一致をチェックするメソッド
	public boolean doPasswordCheck(String password,String confirmPassword){

		boolean ret = false;

		if(!(password.equals(confirmPassword))){
			ret = true;
		}
		return ret;
	}



}

