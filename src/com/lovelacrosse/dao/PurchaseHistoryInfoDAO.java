package com.lovelacrosse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lovelacrosse.dto.PurchaseHistoryInfoDTO;
import com.lovelacrosse.util.DBConnector;
import com.lovelacrosse.util.DateUtil;

public class PurchaseHistoryInfoDAO {

	private DateUtil dateUtil = new DateUtil();

	//購入時に購入履歴テーブルに情報を入れるメソッド
	public int addPurchaseHistoryInfo(String userId, int productId, int productCount, String productColor, int price, int destinationId){
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "insert into purchase_history_info (user_id, product_id, product_count, product_color, price, destination_id, regist_date)"
				+ " values(?,?,?,?,?,?,?)";

		int ret = 0 ;

		try{
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, userId);
		ps.setInt(2, productId);
		ps.setInt(3, productCount);
		ps.setString(4, productColor);
		ps.setInt(5, price);
		ps.setInt(6, destinationId);
		ps.setString(7, dateUtil.getDate());

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

	//購入履歴情報を取得するメソッド
	public ArrayList<PurchaseHistoryInfoDTO> getPurchaseHistoryInfo(String userId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		ArrayList<PurchaseHistoryInfoDTO> purchaseHistoryInfoDTOList = new ArrayList<PurchaseHistoryInfoDTO>();

		String sql = "SELECT"
				+ " phi.product_count as product_count,"
				+ " phi.product_color as product_color,"
				+ " pi.price as price,"
				+ " pi.product_name as product_name,"
				+ " pi.image_file_path as image_file_path, "
				+ " pi.image_file_name as image_file_name, "
				+ " phi.regist_date as regist_date"
				+ " FROM purchase_history_info as phi"
				+ " LEFT JOIN product_info as pi"
				+ " ON phi.product_id = pi.product_id"
				+ " WHERE phi.user_id = ?"
				+ " ORDER BY regist_date desc";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				PurchaseHistoryInfoDTO dto = new PurchaseHistoryInfoDTO();
				dto.setProductCount(rs.getInt("product_count"));
				dto.setProductColor(rs.getString("product_color"));
				dto.setImageFilePath(rs.getString("image_file_path"));
				dto.setImageFileName(rs.getString("image_file_name"));
				dto.setProductName(rs.getString("product_name"));
				dto.setPrice(rs.getInt("price"));
				purchaseHistoryInfoDTOList.add(dto);
			}

		}catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return purchaseHistoryInfoDTOList;
	}



}
