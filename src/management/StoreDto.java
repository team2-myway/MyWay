package management;

import java.sql.Date;

public class StoreDto {
	private int account_no; //sotre_no 
	private String account_name; //관리자명
	private String manager_name; //매장명
	private String manager_area; //매장지역
	private String tel; //전화번호
	
	private int order_no; 
	private int total; //총합계
	private Date date; //날짜
	private String status; //주문상태
	
	private String menu_name; //메뉴이름
	
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
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
