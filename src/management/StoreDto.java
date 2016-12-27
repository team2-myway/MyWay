package management;

import java.sql.Date;

public class StoreDto {
	private int account_no; //sotre_no 
	private String account_name; //�����ڸ�
	private String manager_name; //�����
	private String manager_area; //��������
	private String tel; //��ȭ��ȣ
	
	private String order_code; 
	private int total; //���հ�
	private Date date; //��¥
	private String status; //�ֹ�����
	
	private String menu_name; //�޴��̸�
	
	private int menu_price;
	private int menu_count;
	private String order_date;
	private String side_menu_name;
	private int side_menu_count;
	private int side_menu_countPirce;
	
	public int getAccount_no() {
		return account_no;
	}
	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}
	
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
		
	public String getManager_area() {
		return manager_area;
	}
	public void setManager_area(String manager_area) {
		this.manager_area = manager_area;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_count() {
		return menu_count;
	}
	public void setMenu_count(int menu_count) {
		this.menu_count = menu_count;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getSide_menu_name() {
		return side_menu_name;
	}
	public void setSide_menu_name(String side_menu_name) {
		this.side_menu_name = side_menu_name;
	}
	public int getSide_menu_count() {
		return side_menu_count;
	}
	public void setSide_menu_count(int side_menu_count) {
		this.side_menu_count = side_menu_count;
	}
	public int getSide_menu_countPirce() {
		return side_menu_countPirce;
	}
	public void setSide_menu_countPirce(int side_menu_countPirce) {
		this.side_menu_countPirce = side_menu_countPirce;
	}
	
	
}
