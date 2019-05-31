package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.ProductInfoDAO;
import com.lovelacrosse.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductDetailAction extends ActionSupport implements SessionAware{


	private int productId;
	private List<ProductInfoDTO> relatedProductList;
	private ProductInfoDTO productInfoDTO = new ProductInfoDTO();

	@Override
	public String execute() {

		System.out.println(productId);

		ProductInfoDAO productInfoDAO = new ProductInfoDAO();

		//商品詳細の情報を取得
		productInfoDTO = productInfoDAO.getProductInfoByProductId(productId);

		//関連商品：同じカテゴリーの商品を3つランダムに取得
		relatedProductList = productInfoDAO.getRelatedProductList(productInfoDTO.getCategoryId(), 0, 3);

		String ret = SUCCESS;
		return ret;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public List<ProductInfoDTO> getRelatedProductList() {
		return relatedProductList;
	}
	public void setRelatedProductList(List<ProductInfoDTO> relatedProductList) {
		this.relatedProductList = relatedProductList;
	}
	public ProductInfoDTO getProductInfoDTO() {
		return productInfoDTO;
	}
	public void setProductInfoDTO(ProductInfoDTO productInfoDTO) {
		this.productInfoDTO = productInfoDTO;
	}
}
