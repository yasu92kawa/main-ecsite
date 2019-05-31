package com.lovelacrosse.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lovelacrosse.dao.ProductInfoDAO;
import com.lovelacrosse.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductListAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	private int productId;
	private String productName;
	private String imageFilePath;
	private String imageFileName;
	private List<ProductInfoDTO> sliderProductList1_1;
	private List<ProductInfoDTO> sliderProductList1_2;
	private List<ProductInfoDTO> sliderProductList2_1;
	private List<ProductInfoDTO> sliderProductList2_2;
	private List<ProductInfoDTO> sliderProductList3_1;
	private List<ProductInfoDTO> sliderProductList3_2;
	private List<ProductInfoDTO> sliderProductList4_1;
	private List<ProductInfoDTO> sliderProductList4_2;
	private List<ProductInfoDTO> sliderProductList5_1;
	private List<ProductInfoDTO> sliderProductList5_2;
	private List<ProductInfoDTO> sliderProductList6_1;
	private List<ProductInfoDTO> sliderProductList6_2;

	@Override
	public String execute() {

		ProductInfoDAO productInfoDAO = new ProductInfoDAO();

		//カテゴリーの商品をランダムに取得するメソッド
		sliderProductList1_1 = productInfoDAO.getRelatedProductList(1, 0, 3);
		sliderProductList1_2 = productInfoDAO.getRelatedProductList(1, 0, 3);
		sliderProductList2_1 = productInfoDAO.getRelatedProductList(2, 0, 3);
		sliderProductList2_2 = productInfoDAO.getRelatedProductList(2, 0, 3);
		sliderProductList3_1 = productInfoDAO.getRelatedProductList(3, 0, 3);
		sliderProductList3_2 = productInfoDAO.getRelatedProductList(3, 0, 3);
		sliderProductList4_1 = productInfoDAO.getRelatedProductList(4, 0, 3);
		sliderProductList4_2 = productInfoDAO.getRelatedProductList(4, 0, 3);
		sliderProductList5_1 = productInfoDAO.getRelatedProductList(5, 0, 3);
		sliderProductList5_2 = productInfoDAO.getRelatedProductList(5, 0, 3);
		sliderProductList6_1 = productInfoDAO.getRelatedProductList(6, 0, 3);
		sliderProductList6_2 = productInfoDAO.getRelatedProductList(6, 0, 3);

		String ret = SUCCESS;

		return ret;

	}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public List<ProductInfoDTO> getSliderProductList6_2() {
		return sliderProductList6_2;
	}

	public void setSliderProductList6_2(List<ProductInfoDTO> sliderProductList6_2) {
		this.sliderProductList6_2 = sliderProductList6_2;
	}

	public List<ProductInfoDTO> getSliderProductList1_1() {
		return sliderProductList1_1;
	}

	public void setSliderProductList1_1(List<ProductInfoDTO> sliderProductList1_1) {
		this.sliderProductList1_1 = sliderProductList1_1;
	}

	public List<ProductInfoDTO> getSliderProductList1_2() {
		return sliderProductList1_2;
	}

	public void setSliderProductList1_2(List<ProductInfoDTO> sliderProductList1_2) {
		this.sliderProductList1_2 = sliderProductList1_2;
	}

	public List<ProductInfoDTO> getSliderProductList2_1() {
		return sliderProductList2_1;
	}

	public void setSliderProductList2_1(List<ProductInfoDTO> sliderProductList2_1) {
		this.sliderProductList2_1 = sliderProductList2_1;
	}

	public List<ProductInfoDTO> getSliderProductList2_2() {
		return sliderProductList2_2;
	}

	public void setSliderProductList2_2(List<ProductInfoDTO> sliderProductList2_2) {
		this.sliderProductList2_2 = sliderProductList2_2;
	}

	public List<ProductInfoDTO> getSliderProductList3_1() {
		return sliderProductList3_1;
	}

	public void setSliderProductList3_1(List<ProductInfoDTO> sliderProductList3_1) {
		this.sliderProductList3_1 = sliderProductList3_1;
	}

	public List<ProductInfoDTO> getSliderProductList3_2() {
		return sliderProductList3_2;
	}

	public void setSliderProductList3_2(List<ProductInfoDTO> sliderProductList3_2) {
		this.sliderProductList3_2 = sliderProductList3_2;
	}

	public List<ProductInfoDTO> getSliderProductList4_1() {
		return sliderProductList4_1;
	}

	public void setSliderProductList4_1(List<ProductInfoDTO> sliderProductList4_1) {
		this.sliderProductList4_1 = sliderProductList4_1;
	}

	public List<ProductInfoDTO> getSliderProductList4_2() {
		return sliderProductList4_2;
	}

	public void setSliderProductList4_2(List<ProductInfoDTO> sliderProductList4_2) {
		this.sliderProductList4_2 = sliderProductList4_2;
	}

	public List<ProductInfoDTO> getSliderProductList5_1() {
		return sliderProductList5_1;
	}

	public void setSliderProductList5_1(List<ProductInfoDTO> sliderProductList5_1) {
		this.sliderProductList5_1 = sliderProductList5_1;
	}

	public List<ProductInfoDTO> getSliderProductList5_2() {
		return sliderProductList5_2;
	}

	public void setSliderProductList5_2(List<ProductInfoDTO> sliderProductList5_2) {
		this.sliderProductList5_2 = sliderProductList5_2;
	}

	public List<ProductInfoDTO> getSliderProductList6_1() {
		return sliderProductList6_1;
	}

	public void setSliderProductList6_1(List<ProductInfoDTO> sliderProductList6_1) {
		this.sliderProductList6_1 = sliderProductList6_1;
	}
}
