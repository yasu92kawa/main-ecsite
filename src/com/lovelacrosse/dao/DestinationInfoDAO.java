package com.lovelacrosse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lovelacrosse.dto.DestinationInfoDTO;
import com.lovelacrosse.util.DBConnector;
import com.lovelacrosse.util.DateUtil;

public class DestinationInfoDAO {

	private DateUtil dateUtil = new DateUtil();

	//住所を取得するメソッド
	public ArrayList<DestinationInfoDTO> getDestinationInfoList(String userId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		ArrayList<DestinationInfoDTO> destinationInfoDTOList = new ArrayList<DestinationInfoDTO>();

		String sql = "SELECT *"
				+ "FROM destination_info "
				+ "WHERE user_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				DestinationInfoDTO dto = new DestinationInfoDTO();
				dto.setId(rs.getInt("id"));
				dto.setUserId(rs.getString("user_id"));
				dto.setFamilyName(rs.getString("family_name"));
				dto.setFirstName(rs.getString("first_name"));
				dto.setPostalCode(rs.getInt("postal_code"));
				dto.setPrefectures(rs.getString("prefectures"));
				dto.setFirstAddress(rs.getString("first_address"));
				dto.setSecondAddress(rs.getString("second_address"));
				dto.setTel(rs.getString("tel"));
				destinationInfoDTOList.add(dto);
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

		return destinationInfoDTOList;
	}

	//住所を登録するメソッド
	public int addDestinationInfo(String userId, String familyName, String firstName, String postalCode, String prefectures, String firstAddress, String secondAddress, String tel) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "INSERT into destination_info "
				+ "(user_id, family_name, first_name, postal_code, prefectures, first_address, second_address, tel, regist_date, update_date) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";

		int ret = 0 ;

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, userId);
			ps.setString(2, familyName);
			ps.setString(3, firstName);
			ps.setString(4, postalCode);
			ps.setString(5, prefectures);
			ps.setString(6, firstAddress);
			ps.setString(7, secondAddress);
			ps.setString(8, tel);
			ps.setString(9, dateUtil.getDate());
			ps.setString(10, dateUtil.getDate());

			ret = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return ret;
	}

	//宛先IDに紐づいたデータを取得するメソッド
	public List<DestinationInfoDTO> getDestinationInfo(int destinationId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		ArrayList<DestinationInfoDTO> choosenDestinationInfoDTOList = new ArrayList<DestinationInfoDTO>();

		String sql = "SELECT *"
				+ "FROM destination_info "
				+ "WHERE id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, destinationId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				DestinationInfoDTO dto = new DestinationInfoDTO();
				dto.setUserId(rs.getString("user_id"));
				dto.setFamilyName(rs.getString("family_name"));
				dto.setFirstName(rs.getString("first_name"));
				dto.setPostalCode(rs.getInt("postal_code"));
				dto.setPrefectures(rs.getString("prefectures"));
				dto.setFirstAddress(rs.getString("first_address"));
				dto.setSecondAddress(rs.getString("second_address"));
				dto.setTel(rs.getString("tel"));
				choosenDestinationInfoDTOList.add(dto);
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

		return choosenDestinationInfoDTOList;
	}

	//宛先IDに紐づいたデータを削除するメソッド
	public int deleteDestinationInfo(int destinationId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "DELETE FROM destination_info WHERE id = ?";
		int count = 0;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, destinationId);
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
