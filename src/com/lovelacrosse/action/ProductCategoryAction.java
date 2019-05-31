package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.ProductInfoDAO;
import com.lovelacrosse.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductCategoryAction extends ActionSupport implements SessionAware{

	private String categoryId;

	private List<ProductInfoDTO> ProductCategoryInfoDTOList;

	@Override
	public String execute() {

		ProductInfoDAO productInfoDAO = new ProductInfoDAO();
		//カテゴリーに対応した商品情報を取得するメソッド
		ProductCategoryInfoDTOList = productInfoDAO.getProductInfoListByCategoryId(categoryId);

		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public List<ProductInfoDTO> getProductCategoryInfoDTOList() {
		return ProductCategoryInfoDTOList;
	}
	public void setProductCategoryInfoDTOList(List<ProductInfoDTO> productCategoryInfoDTOList) {
		ProductCategoryInfoDTOList = productCategoryInfoDTOList;
	}



}
