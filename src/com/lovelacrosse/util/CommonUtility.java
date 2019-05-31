package com.lovelacrosse.util;

public class CommonUtility {

	//ランダムな1~10の数を16回足した数を返す
	public String getRamdomValue() {
		String value="";
		double d;
		for(int i=1; i<=16; i++) {
			d=Math.random() * 10;
			value=value+((int)d);
		}
		return value;
	}

	//パスワードの一文字目以外を隠す
	public String concealPassword(String password) {

		StringBuilder stringBuilder = new StringBuilder("●●●●●●");
		String concealPassword = stringBuilder.replace(0, 1, password.substring(0,1)).toString();

		return concealPassword;
	}

}
