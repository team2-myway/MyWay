package order;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class OrderDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public OrderDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MysqlDB");
			
		}catch(Exception err){
			System.out.println("연결 실패" + err);
		}
	}
	public void FavoriteSave(OrderDto dto){
		String sql = "insert into fa";
	}
	public void StampAdd(int account_no, int count){
		String sql = "";
		try{
		sql = "select stamp from account where account_no = ?";
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, account_no);
		rs = stmt.executeQuery();
		rs.next();
		int stamp = rs.getInt("stamp");
		int countstamp = stamp+count;
		// 회원의 스탬프의 갯수를 늘림
		sql ="update account set stamp=? where account_no = ?";
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, countstamp);
		stmt.setInt(2, account_no);
		stmt.executeUpdate();
		}catch(Exception err){
			System.out.println("addSawon"+err);
		}finally{
			freeConnection();
		}
	}
	public void DetailOrderSave(OrderDto dto){
		String sql = "";
		
		try{
			sql = "insert into detail_order(order_code, bread_no, menu_no, vegetable_no, sauce_no, count, price, favorite)"
					+ " values (?, ?, ?, ?, ?, ?,?,?);";
			
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getOrder_code());
			stmt.setInt(2, dto.getBread_no());
			stmt.setInt(3, dto.getMenu_no());
			stmt.setString(4, dto.getVegetable_no_List());
			stmt.setString(5, dto.getSauce_no_List());
			stmt.setInt(6, dto.getMenu_count());
			stmt.setInt(7, dto.getMenu_price());
			stmt.setString(8, dto.getFavorite());
			stmt.executeUpdate();
		//	System.out.println(sql);
			//회원이 가진 스템프의 갯수 알기위함
			StampAdd(dto.getAccount_no(), dto.getMenu_count());
			OrderSave(dto);
		}catch(Exception err){
			System.out.println("addSawon"+err);
		}finally{
			freeConnection();
		}
	}
	public void OrderSave(OrderDto dto){
		String sql = "insert into main_order(order_code,account_no, account_name, account_tel, store_no, total, date, status) "
				+ "values (?, ?, ?, ?, ?, ?, date_format(now(),'%Y/%m/%d %H:%i:%s'),'주문완료')";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getOrder_code());
			stmt.setInt(2, dto.getAccount_no());
			stmt.setString(3, "");
			stmt.setString(4, "");
			stmt.setInt(5, dto.getManage_no());
			stmt.setInt(6, dto.getMenu_price());
			stmt.executeUpdate();
			//System.out.println(sql);
		}catch(Exception err){
			System.out.println("addSawon"+err);
		}finally{
			freeConnection();
		}
	
	}
	
	public String Order_Code(int account_no, String date){
		String ordermax_no = "";
		String sql = "select id from account where account_no = "+account_no;
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			rs.next();
			String dates = date.substring(1,6);
			String id = rs.getString("id").substring(2);
			ordermax_no = "ORD"+id+"NO"+dates;
			//System.out.println(ordermax_no);
			
		}catch(Exception err){
			System.out.println("SouceList" + err);
		}finally{
			freeConnection();
		}
		return ordermax_no;
	}
	

	//메뉴 사이즈 별로 나오게 하는 것들 클래스도 지정
	public ArrayList MenuSizeList(String menusize, String menuclass){
		ArrayList list = new ArrayList();
		String sql="";
		if(menuclass.equals("All")){
			sql = "select * from menu where menu_size = '"+menusize+"'";
		}else{
			sql = "select * from menu where menu_size = '"+menusize+"' and class = '"+menuclass+"'";
		}
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setMenu_no(rs.getInt("menu_no"));
				dto.setMenu_class(rs.getString("class"));
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_image(rs.getString("image"));
				dto.setMenu_price(rs.getInt("price"));
				dto.setMenu_bestSouce(rs.getString("sauce_no"));
				dto.setMenu_calorie(rs.getInt("calorie"));
				dto.setMenu_detail(rs.getString("detail"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("SouceList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	
	// 메뉴의 추천소스를 뽑아오기 
	public ArrayList BestSauce(String menu_no){
		ArrayList list = new ArrayList();
		OrderDto dto = new OrderDto();
		
			try{
				String sql = "select sauce_no from menu where menu_no = '"+menu_no+"'";
				
				con = ds.getConnection();
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				while(rs.next()){
					dto.setMenu_bestSouce(rs.getString("sauce_no"));
				}
				
				String[] sauce = dto.getMenu_bestSouce().split("\\|");
				String bestsauce = "";
				String sql1="select name from sauce where ";
					
					for(int i=0; i<sauce.length; i++){
						bestsauce = sauce[i];
						// 배열의 마지막을 확인 마지막때는 or 을 넣으면 안되기 때문
						if(sauce[i]==sauce[sauce.length-1]){
							sql1 += "sauce_no = '"+ bestsauce +"'";
						}else{
							sql1 += "sauce_no = '"+ bestsauce +"' or ";
						}
					}
					con = ds.getConnection();
					stmt = con.prepareStatement(sql1);
					rs = stmt.executeQuery();
					
					
					for(int i=0; i<sauce.length; i++){
						rs.next();
						list.add(rs.getString("name"));
					}
			
			}catch(Exception err){
				System.out.println("BestSauce" + err);
			}finally {
				freeConnection();
				
			}
		return list;
	}
	
	
	// 메뉴 클래스 에 대한 리스트
	public ArrayList MenuClassList(){
		ArrayList list = new ArrayList();
		String sql = "select class from menu group by class";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setMenu_class(rs.getString("class"));
				list.add(dto);
			}
		}catch(Exception err){
			System.out.println("SouceList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	//빵 리스트 뽑기
	public ArrayList BreadList(){
		ArrayList list = new ArrayList();
		String sql = "select * from bread";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setBread_no(rs.getInt("bread_no"));
				dto.setBread_name(rs.getString("name"));
				dto.setBread_detail(rs.getString("detail"));
				list.add(dto);
			}
		}catch(Exception err){
			System.out.println("SouceList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	
	
	//소스 리스트 
	public ArrayList SauceList(String sauce){
		ArrayList list = new ArrayList();
			String sql = "select * from sauce where class='"+sauce+"'";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setSauce_no(rs.getInt("sauce_no"));
				dto.setSauce_class(rs.getString("class"));
				dto.setSauce_name(rs.getString("name"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("SouceList" + err);
		}finally{
			freeConnection();
		}
		return list;
	}
	// 채소 리스트
	public ArrayList VegetableList(){
		ArrayList list = new ArrayList();
		String sql = "select * from vegetable";
	try{
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			OrderDto dto = new OrderDto();
			dto.setVegetable_no(rs.getInt("vegetable_no"));
			dto.setVegetable_name(rs.getString("name"));
			dto.setVegetable_img(rs.getString("img"));
			list.add(dto);
		}
		
	}catch(Exception err){
		System.out.println("VegetableList" + err);
	}finally{
		freeConnection();
	}
		return list;
	}
	
	public ArrayList ManagerAddrList(){
		ArrayList list = new ArrayList();
		String sql = "SELECT manager_area FROM myway.account where level = 'super' or level = 'manager' group by manager_area;";
	try{
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			OrderDto dto = new OrderDto();
			dto.setManage_addr(rs.getString("manager_area"));;
			list.add(dto);
		}
		
	}catch(Exception err){
		System.out.println("ManagerAddrList" + err);
	}finally{
		freeConnection();
	}
		return list;
	}
	
	public ArrayList ManagerList(String area){
		
		ArrayList list = new ArrayList();
		String sql = "SELECT * FROM myway.account where (level = 'super' or level = 'manager') and manager_area='"+area+"'";
	try{
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			OrderDto dto = new OrderDto();
			dto.setManage_no(rs.getInt("account_no"));
			dto.setManage_name(rs.getString("manager_name"));
			dto.setManage_addr(rs.getString("manager_area"));
			list.add(dto);
		}
		
	}catch(Exception err){
		System.out.println("ManagerAddrList" + err);
	}finally{
		freeConnection();
	}
		return list;
	}
	
	
		
	public void freeConnection(){
		if(rs!= null){try{rs.close();}catch(Exception err){}}
		if(con!= null){try{con.close();}catch(Exception err){}}
		if(stmt!= null){try{stmt.close();}catch(Exception err){}}
	}
	
}
