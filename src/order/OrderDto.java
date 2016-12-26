package order;

import java.util.ArrayList;

public class OrderDto {
	private ArrayList vegetableOrderNo;
	private ArrayList sauceOrderNo;
	
	public ArrayList getVegetableOrderNo() {
		return vegetableOrderNo;
	}
	public void setVegetableOrderNo(ArrayList vegetableOrderNo) {
		this.vegetableOrderNo = vegetableOrderNo;
	}
	public ArrayList getSauceOrderNo() {
		return sauceOrderNo;
	}
	public void setSauceOrderNo(ArrayList sauceOrderNo) {
		this.sauceOrderNo = sauceOrderNo;
	}
	//고객 정보
	private int account_no;
	private String account_name;
	private String account_tel;
	//매장
	private String manage_addr;
	private String manage_name;
	private int manage_no;
	
	//메뉴
	private String menu_size;
	private String menu_class;
	private int menu_no;
	private String menu_image;
	private int menu_price;
	private String menu_name;
	private int menu_calorie;
	private String menu_bestSouce;
	private String menu_detail;
	private int menu_count;
	//채소
	private int vegetable_no;
	private String vegetable_name;
	private String vegetable_img;
	
	//빵 종류
	private int bread_no;
	private String bread_name;
	private String bread_detail;
	
	//소스
	private int sauce_no;
	private String sauce_name;
	private String sauce_class;
	
	//사이드 메뉴
	private int side_menu_no ;
	private String side_category;
	private String side_menu_name;
	private String side_menu_img;
	private int side_menu_calorie;
	private int side_menu_price;
	private String side_menu_detail;
	
	private int[] side_menu_noList;
	private int[] side_menu_countList;
	private int[] side_meun_count_priceList;
	
	
	private String vegetable_no_List;
	private String Sauce_no_List;
	
	private String order_code;
	private String favorite;
	private String order_date;
	private int order_price;
	
	public int[] getSide_menu_noList() {
		return side_menu_noList;
	}
	public void setSide_menu_noList(int[] side_menu_noList) {
		this.side_menu_noList = side_menu_noList;
	}
	
	
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	
	public int[] getSide_menu_countList() {
		return side_menu_countList;
	}
	public void setSide_menu_countList(int[] side_menu_countList) {
		this.side_menu_countList = side_menu_countList;
	}
	public int[] getSide_meun_count_priceList() {
		return side_meun_count_priceList;
	}
	public void setSide_meun_count_priceList(int[] side_meun_count_priceList) {
		this.side_meun_count_priceList = side_meun_count_priceList;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public int getMenu_count() {
		return menu_count;
	}
	public void setMenu_count(int menu_count) {
		this.menu_count = menu_count;
	}
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
	public String getAccount_tel() {
		return account_tel;
	}
	public void setAccount_tel(String account_tel) {
		this.account_tel = account_tel;
	}
	public int getManage_no() {
		return manage_no;
	}
	public void setManage_no(int manage_no) {
		this.manage_no = manage_no;
	}
	public String getVegetable_no_List() {
		return vegetable_no_List;
	}
	public void setVegetable_no_List(String vegetable_no_List) {
		this.vegetable_no_List = vegetable_no_List;
	}
	public String getSauce_no_List() {
		return Sauce_no_List;
	}
	public void setSauce_no_List(String sauce_no_List) {
		Sauce_no_List = sauce_no_List;
	}
	public String getManage_addr() {
		return manage_addr;
	}
	public void setManage_addr(String manage_addr) {
		this.manage_addr = manage_addr;
	}
	public String getManage_name() {
		return manage_name;
	}
	public void setManage_name(String manage_name) {
		this.manage_name = manage_name;
	}
	public String getMenu_size() {
		return menu_size;
	}
	public void setMenu_size(String menu_size) {
		this.menu_size = menu_size;
	}
	public String getMenu_class() {
		return menu_class;
	}
	public void setMenu_class(String menu_class) {
		this.menu_class = menu_class;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_image() {
		return menu_image;
	}
	public void setMenu_image(String menu_image) {
		this.menu_image = menu_image;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_calorie() {
		return menu_calorie;
	}
	public void setMenu_calorie(int menu_calorie) {
		this.menu_calorie = menu_calorie;
	}
	public String getMenu_bestSouce() {
		return menu_bestSouce;
	}
	public void setMenu_bestSouce(String menu_bestSouce) {
		this.menu_bestSouce = menu_bestSouce;
	}
	public String getMenu_detail() {
		return menu_detail;
	}
	public void setMenu_detail(String menu_detail) {
		this.menu_detail = menu_detail;
	}
	public int getVegetable_no() {
		return vegetable_no;
	}
	public void setVegetable_no(int vegetable_no) {
		this.vegetable_no = vegetable_no;
	}
	public String getVegetable_name() {
		return vegetable_name;
	}
	public void setVegetable_name(String vegetable_name) {
		this.vegetable_name = vegetable_name;
	}
	public String getVegetable_img() {
		return vegetable_img;
	}
	public void setVegetable_img(String vegetable_img) {
		this.vegetable_img = vegetable_img;
	}
	public int getBread_no() {
		return bread_no;
	}
	public void setBread_no(int bread_no) {
		this.bread_no = bread_no;
	}
	public String getBread_name() {
		return bread_name;
	}
	public void setBread_name(String bread_name) {
		this.bread_name = bread_name;
	}
	public String getBread_detail() {
		return bread_detail;
	}
	public void setBread_detail(String bread_detail) {
		this.bread_detail = bread_detail;
	}
	public int getSauce_no() {
		return sauce_no;
	}
	public void setSauce_no(int sauce_no) {
		this.sauce_no = sauce_no;
	}
	public String getSauce_name() {
		return sauce_name;
	}
	public void setSauce_name(String sauce_name) {
		this.sauce_name = sauce_name;
	}
	public String getSauce_class() {
		return sauce_class;
	}
	public void setSauce_class(String sauce_class) {
		this.sauce_class = sauce_class;
	}
	public int getSide_menu_no() {
		return side_menu_no;
	}
	public void setSide_menu_no(int side_menu_no) {
		this.side_menu_no = side_menu_no;
	}
	public String getSide_category() {
		return side_category;
	}
	public void setSide_category(String side_category) {
		this.side_category = side_category;
	}
	public String getSide_menu_name() {
		return side_menu_name;
	}
	public void setSide_menu_name(String side_menu_name) {
		this.side_menu_name = side_menu_name;
	}
	public String getSide_menu_img() {
		return side_menu_img;
	}
	public void setSide_menu_img(String side_menu_img) {
		this.side_menu_img = side_menu_img;
	}
	public int getSide_menu_calorie() {
		return side_menu_calorie;
	}
	public void setSide_menu_calorie(int side_menu_calorie) {
		this.side_menu_calorie = side_menu_calorie;
	}
	public int getSide_menu_price() {
		return side_menu_price;
	}
	public void setSide_menu_price(int side_menu_price) {
		this.side_menu_price = side_menu_price;
	}
	public String getSide_menu_detail() {
		return side_menu_detail;
	}
	public void setSide_menu_detail(String side_menu_detail) {
		this.side_menu_detail = side_menu_detail;
	}
	
	
}
