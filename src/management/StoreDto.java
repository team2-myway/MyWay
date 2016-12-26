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
	
}
