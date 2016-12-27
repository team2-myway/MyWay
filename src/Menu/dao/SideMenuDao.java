package Menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Menu.dto.MenuDto;
import Menu.dto.SideMenuDto;
import order.OrderDto;

public class SideMenuDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public SideMenuDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
			
		}catch(Exception err){
			System.out.println("DBConnect error : " + err);
		}
	}
	
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
	
	public void AddSideMenu(SideMenuDto dto){
		try{
			String sql = "insert into side_menu "
					+ "(category, side_menu_name, image, calorie, price, detail)"
					+ " value(?, ?, ?, ?, ?, ?);";
			con = ds.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getM_category());
			stmt.setString(2, dto.getM_name());
			stmt.setString(3, dto.getM_img());
			stmt.setInt(4, dto.getM_calorie());
			stmt.setInt(5, dto.getM_price());
			stmt.setString(6, dto.getM_detail());
			
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("AddSideMenu() : " + err);
		}
		finally{
			freeConnection();
		}

	}
	
	
	public ArrayList SideMenuList(){
		ArrayList list = new ArrayList();
		String sql = "select side_menu_no, side_menu_name, image, price from side_menu";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				SideMenuDto dto = new SideMenuDto();
				dto.setM_no(rs.getInt("side_menu_no"));
				dto.setM_name(rs.getString("side_menu_name"));
				dto.setM_img(rs.getString("image"));
				dto.setM_price(rs.getInt("price"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("SideMenuList" + err);
		
		}finally{
			freeConnection();
		}
		return list;
	}
	
	//�󼼺���
	public SideMenuDto SideMenuDetailList(int menu_no){
		SideMenuDto dto = new SideMenuDto();

		String sql = "select category, side_menu_name, image, calorie, price, detail from side_menu where side_menu_no=?";

		//String sql = "select image, category, side_menu_name, calorie, price, detail from side_menu where side_menu_no=?";

		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, menu_no);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				dto.setM_category(rs.getString("category"));
				dto.setM_name(rs.getString("side_menu_name"));
				dto.setM_img(rs.getString("image"));
				dto.setM_calorie(rs.getInt("calorie"));
				dto.setM_price(rs.getInt("price"));
				dto.setM_detail(rs.getString("detail"));
				dto.setM_img(rs.getString("image"));
			}
			
		}catch(Exception err){
			System.out.println("SideMenuDetailList" + err);
		
		}finally{
			freeConnection();
		}
		return dto;
	}
	public void UpdateSideMenu(SideMenuDto dto){
		try{
			String sql = "update side_menu set category=?, side_menu_name=?, image=?, calorie=?, price=?, detail=? "
					+ "where side_menu_no=?";
			con = ds.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getM_category());
			stmt.setString(2, dto.getM_name());
			stmt.setString(3, dto.getM_img());
			stmt.setInt(4, dto.getM_calorie());
			stmt.setInt(5, dto.getM_price());
			stmt.setString(6, dto.getM_detail());
			stmt.setInt(7, dto.getM_no());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("UpdateSideMenu() : " + err);
		}
		finally{
			freeConnection();
		}

	}
	
	public void SideMenuDelete(int menu_no) {
		String sql = "delete from side_menu where side_menu_no=?";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, menu_no);
			stmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("SideMenuDelete" + err);
			
		
		}finally{
			freeConnection();
		}
	}
	
public void freeConnection(){
	if(rs!= null){try{rs.close();}catch(Exception err){}}
	if(con!= null){try{con.close();}catch(Exception err){}}
	if(stmt!= null){try{stmt.close();}catch(Exception err){}}
}

}

