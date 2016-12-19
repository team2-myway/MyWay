package Menu.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MenuDto {
	private String m_class;
	private int m_size;
	private String m_name;
	private String m_img;
	private int m_calorie;
	private int m_price;
	private String m_detail;
	private String m_recomsrc;


	public String getM_class() {
		return m_class;
	}
	public void setM_class(String m_class) {
		this.m_class = m_class;
	}
	public int getM_size() {
		return m_size;
	}
	public void setM_size(int m_size) {
		this.m_size = m_size;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public int getM_calorie() {
		return m_calorie;
	}
	public void setM_calorie(int m_calorie) {
		this.m_calorie = m_calorie;
	}
	public int getM_price() {
		return m_price;
	}
	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	public String getM_detail() {
		return m_detail;
	}
	public void setM_detail(String m_detail) {
		this.m_detail = m_detail;
	}
	public String getM_recomsrc() {
		return m_recomsrc;
	}
	public void setM_recomsrc(String m_recomsrc) {
		this.m_recomsrc = m_recomsrc;
	}
}

	