package com.lovelacrosse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lovelacrosse.dto.UserInfoDTO;
import com.lovelacrosse.util.DBConnector;
import com.lovelacrosse.util.DateUtil;

public class UserInfoDAO {

	private DateUtil dateUtil = new DateUtil();

	//ユーザーIDがすでに登録されていないかチェックするメソッド
	public boolean checkUserIdInfo(String userId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "SELECT COUNT(*) AS count"
				+ " FROM user_info "
				+ " WHERE user_id = ?";

		boolean ret = false;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				if(rs.getInt("count")>0){
					ret = true;
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return ret;
	}

	//新規ユーザー情報を登録するメソッド
	public int addUserInfo(String familyName, String firstName, String familyNameKana, String firstNameKana, String sex, String email,
			String userId, String password) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "INSERT into user_info "
				+ "(family_name, first_name, family_name_kana, first_name_kana,"
				+ " sex, email, user_id, password, regist_date, update_date) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";

		int count = 0 ;

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, familyName);
			ps.setString(2, firstName);
			ps.setString(3, familyNameKana);
			ps.setString(4, firstNameKana);
			ps.setString(5, sex);
			ps.setString(6, email);
			ps.setString(7, userId);
			ps.setString(8, password);
			ps.setString(9, dateUtil.getDate());
			ps.setString(10, dateUtil.getDate());

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

	//入力値とデータベースの情報が一致するかチェックするメソッド
	public boolean loginCheck(String loginUserId, String password) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "SELECT COUNT(user_id) as count"
					+ " FROM user_info "
					+ " WHERE user_id = ? and password = ?";

		boolean ret = false;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				if(rs.getInt("count")>0){
					ret = true;
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return ret;
	}

	//ユーザーの情報を取得するメソッド
	public UserInfoDTO getUserInfo(String userId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		UserInfoDTO dto = new UserInfoDTO();

		String sql = "SELECT * FROM user_info "
				+ "WHERE user_id = ? ";

		try {

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				dto.setUserId(rs.getString("user_id"));
				dto.setPassword(rs.getString("password"));
				dto.setFamilyName(rs.getString("family_name"));
				dto.setFirstName(rs.getString("first_name"));
				dto.setFamilyNameKana(rs.getString("family_name_kana"));
				dto.setFirstNameKana(rs.getString("first_name_kana"));
				dto.setEmail(rs.getString("email"));
			}

		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return dto;
	}

	//ユーザー情報の変更をするメソッド
	public int changeUserInfo(String userId, String familyName, String firstName, String familyNameKana, String firstNameKana, String sex, String email) {
		DBConnector db = new DBConnector();
		Connection conn = db.getConnection();
		String sql = "UPDATE user_info"
				+ " SET family_name =?, first_name = ?, family_name_kana = ?, first_name_kana = ?, sex = ?, email = ?, update_date = ?"
				+ " WHERE user_id=?";
		int count = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, familyName);
			ps.setString(2, firstName);
			ps.setString(3, familyNameKana);
			ps.setString(4, firstNameKana);
			ps.setString(5, sex);
			ps.setString(6, email);
			ps.setString(7, dateUtil.getDate());
			ps.setString(8, userId);

			count = ps.executeUpdate();

		}catch (SQLException e){
			e.printStackTrace();
		}
		try{
			conn.close();
		}	catch(SQLException e) {
				e.printStackTrace();
		}
		return count;
	}

	//ユーザーIDと現在のパスワードを確認するメソッド
	public boolean checkUserIdPasswordInfo(String userId, String password) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "SELECT COUNT(*) AS count"
				+ " FROM user_info "
				+ " WHERE user_id = ? and password = ?";

		boolean ret = true;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				if(rs.getInt("count")>0){
					ret = false;
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return ret;
	}

	//パスワードを変更をするメソッド
		public int changeUserPassword(String password, String userId) {
			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "UPDATE user_info"
					+ " SET password = ?"
					+ " WHERE user_id = ?";
			int count = 0;

			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, password);
				ps.setString(2, userId);

				count = ps.executeUpdate();

			}catch (SQLException e){
				e.printStackTrace();
			}
			try{
				con.close();
			}	catch(SQLException e) {
					e.printStackTrace();
			}
			return count;
		}



}
