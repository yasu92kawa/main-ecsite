package com.lovelacrosse.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lovelacrosse.dto.CartInfoDTO;
import com.lovelacrosse.util.DBConnector;
import com.lovelacrosse.util.DateUtil;


public class CartInfoDAO {

	private DateUtil dateUtil = new DateUtil();

		//カート追加する際に同じ商品があるかを確かめるメソッド
		public boolean checkSameCartItem(String userId, int productId, String productColor) {

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "SELECT count(id) as count "
					+ "FROM cart_info "
					+ "WHERE user_id = ? and product_id = ? and product_color = ? ";

			boolean ret = false;

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				ps.setInt(2, productId);
				ps.setString(3, productColor);
				ResultSet rs = ps.executeQuery();

				if(rs.next()){
					if(rs.getInt("count") > 0) {
						ret = true;
					}
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
			return ret;
		}

		//カート追加時に同じ商品がすでにカートにあった場合、個数を更新する
		public int updateCartCount(String userId, int productId, String productColor, int productCount) {

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "UPDATE cart_info SET product_count = (product_count + ?), update_date = ?  WHERE user_id = ? and product_id=? and product_color=?";

			int ret = 0;

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1,productCount);
				ps.setString(2,dateUtil.getDate());
				ps.setString(3,userId);
				ps.setInt(4,productId);
				ps.setString(5,productColor);
				ret = ps.executeUpdate();

			}catch(SQLException e){
				e.printStackTrace();
			}finally {
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			return ret;
		}

		//カート追加時にカートテーブルに情報を入れる
		public int addCartInfo(String user_id, int product_id, String product_color, int product_count, int price){
			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "insert into cart_info (user_id, product_id, product_count, product_color, price, regist_date, update_date) values(?,?,?,?,?,?,?)";

			int ret = 0 ;

			try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, user_id);
			ps.setInt(2, product_id);
			ps.setInt(3, product_count);
			ps.setString(4, product_color);
			ps.setInt(5, price);
			ps.setString(6, dateUtil.getDate());
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

		//ユーザーに対応するカートの商品情報を取得するメソッド
		public ArrayList<CartInfoDTO> getUserCartInfo(String user_id){

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			ArrayList<CartInfoDTO> cartInfoDTOList = new ArrayList<CartInfoDTO>();

			String sql="select"
					+ " ci.id as id,"
					+ " ci.user_id as user_id,"
					+ " ci.product_id as product_id,"
					+ " ci.product_color as product_color,"
					+ " ci.product_count as product_count,"
					+ " pi.price as price,"
					+ " pi.product_name as product_name,"
					+ " pi.image_file_path as image_file_path, "
					+ " pi.image_file_name as image_file_name, "
					+ " pi.release_date as release_date,"
					+ " (ci.product_count * ci.price) as subtotal,"
					+ " ci.regist_date as regist_date,"
					+ " ci.update_date as update_date"
					+ " FROM cart_info as ci"
					+ " LEFT JOIN product_info as pi"
					+ " ON ci.product_id = pi.product_id"
					+ " WHERE ci.user_id = ?"
					+ " order by update_date desc, regist_date desc";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, user_id);
				ResultSet rs = ps.executeQuery();

				while(rs.next()){
					CartInfoDTO dto = new CartInfoDTO();
					dto.setId(rs.getInt("id"));
					dto.setProductId(rs.getInt("product_id"));
					dto.setUserId(rs.getString("user_id"));
					dto.setProductColor(rs.getString("product_color"));
					dto.setProductCount(rs.getInt("product_count"));
					dto.setProductName(rs.getString("product_name"));
		        	dto.setPrice(rs.getInt("price"));
		        	dto.setImageFilePath(rs.getString("image_file_path"));
		    		dto.setImageFileName(rs.getString("image_file_name"));
		        	dto.setReleaseDate(rs.getString("release_date"));
		        	cartInfoDTOList.add(dto);
		        }
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return cartInfoDTOList;
		}

		//チェックがついたカート情報を削除するメソッド
		public int deleteCartInfo(String user_id, String product_id){

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "DELETE FROM cart_info "
					+ "WHERE user_id = ? AND product_id = ?";

			int count = 0 ;

			try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, user_id);
			ps.setString(2, product_id);

			count = ps.executeUpdate();

			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return count;
		}

		//カートの合計金額を計算するメソッド
		public int getTotalPrice(String userId){

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "SELECT sum(price * product_count) as total_price "
		      			+ "FROM cart_info "
		      			+ "WHERE user_id = ? "
		      			+ "GROUP BY user_id";

			int ret = 0;
			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				ResultSet rs = ps.executeQuery();

				if(rs.next()){
					ret = rs.getInt("total_price");
				}

				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
					con.close();
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
			return ret;
		  }

		//カートの商品個数を計算するメソッド
		public int getTotalCount(String userId){

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "SELECT sum(product_count) as total_count "
		      			+ "FROM cart_info "
		      			+ "WHERE user_id = ? "
		      			+ "GROUP BY user_id";

			int ret = 0;
			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				ResultSet rs = ps.executeQuery();

				if(rs.next()){
					ret = rs.getInt("total_count");
				}

				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
					con.close();
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
			return ret;
		  }

		//チェックがついたカート情報を削除するメソッド
		public int deleteCartInfo(String user_id, int product_id, String product_color){

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();

			String sql = "DELETE FROM cart_info "
						+ "WHERE user_id = ? AND product_id = ? AND product_color = ?";

			int ret = 0 ;

			try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, user_id);
			ps.setInt(2, product_id);
			ps.setString(3, product_color);

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

		//商品購入時に全てのカート情報を削除するメソッド
		public int deleteAllCartInfo(String userId) {

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();
			int count = 0;

			String sql = "DELETE FROM cart_info WHERE user_id = ? ";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				count = ps.executeUpdate();

				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
					con.close();
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
			return count;
		}

		//カートのユーザーIDを変更するメソッド
		public int changeUserId(String temporaryUserId, String loginUserId, int productId, int productCount) {

			DBConnector db = new DBConnector();
			Connection con = db.getConnection();
			int count = 0;

			String sql = "UPDATE cart_info "
						+ "SET user_id = ?, update_date = now() "
						+ "WHERE user_id = ? and  product_id = ? and product_count = ?";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, loginUserId);
				ps.setString(2, temporaryUserId);
				ps.setInt(3, productId);
				ps.setInt(4, productCount);

				count = ps.executeUpdate();

				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
					con.close();
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
			return count;
		}

}
