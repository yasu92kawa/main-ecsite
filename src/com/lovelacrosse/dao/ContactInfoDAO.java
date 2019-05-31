package com.lovelacrosse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.lovelacrosse.util.DBConnector;
import com.lovelacrosse.util.DateUtil;

public class ContactInfoDAO {

	private DateUtil dateUtil = new DateUtil();

	public int addContactInfo(String name, String email, String title, String comments) {
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "INSERT into contact "
				+ "(name, email, title, comments, regist_date) "
				+ "values(?,?,?,?,?)";

		int count = 0 ;

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, title);
			ps.setString(4, comments);
			ps.setString(5, dateUtil.getDate());

			count = ps.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}

}
