package com.lovelacrosse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lovelacrosse.dto.ProductInfoDTO;
import com.lovelacrosse.util.DBConnector;

public class ProductInfoDAO {

	//商品一覧画面でカテゴリー毎のスライダーに表示する商品を取得するメソッド
	public List<ProductInfoDTO> getRelatedProductList(int categoryId, int limitOffset,int limitRowCount) {
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		List<ProductInfoDTO> sliderProductList = new ArrayList<ProductInfoDTO>();

		//order by rand() limitは「?行目から?個」のデータをランダムに取ってくるという意味。
		String sql = "select * from product_info "
				+ "where category_id=? "
				+ "order by rand() limit ?,?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ps.setInt(2, limitOffset);
			ps.setInt(3, limitRowCount);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProductInfoDTO productInfoDTO=new ProductInfoDTO();
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				sliderProductList.add(productInfoDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sliderProductList;
	}

	//該当するカテゴリーIDの商品を取得するメソッド・
	public List<ProductInfoDTO> getProductInfoListByCategoryId(String categoryId) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		List<ProductInfoDTO> productInfoDTOList = new ArrayList<ProductInfoDTO>();

		String sql = "SELECT *"
				+ " FROM product_info"
				+ " WHERE category_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,categoryId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProductInfoDTO productInfoDTO = new ProductInfoDTO();
				productInfoDTO.setId(rs.getInt("id"));
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setCategoryId(rs.getInt("category_id"));
				productInfoDTO.setCategoryName(rs.getString("category_name"));
				productInfoDTO.setPrice(rs.getInt("price"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				productInfoDTOList.add(productInfoDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return productInfoDTOList;
	}

	//商品詳細画面の値を取得するメソッド
	public ProductInfoDTO getProductInfoByProductId(int productId) {
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		String sql = "SELECT *"
				+ " FROM product_info"
				+ " WHERE product_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, productId);
			ResultSet ret = ps.executeQuery();

			while (ret.next()) {
				productInfoDTO.setId(ret.getInt("id"));
				productInfoDTO.setProductId(ret.getInt("product_id"));
				productInfoDTO.setProductName(ret.getString("product_name"));;
				productInfoDTO.setCategoryId(ret.getInt("category_id"));
				productInfoDTO.setPrice(ret.getInt("price"));
				productInfoDTO.setImageFilePath(ret.getString("image_file_path"));
				productInfoDTO.setImageFileName(ret.getString("image_file_name"));
				productInfoDTO.setReleaseDate(ret.getString("release_date"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return productInfoDTO;
	}

}
