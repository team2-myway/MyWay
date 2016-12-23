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
