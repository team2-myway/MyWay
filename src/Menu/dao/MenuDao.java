package Menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Menu.dto.MenuDto;
import order.OrderDto;

public class MenuDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MenuDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
			
		}catch(Exception err){
			System.out.println("���� ����" + err);
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
	
	public void AddMenu(MenuDto dto){
		try{
			String sql = "insert into menu "
					+ "(class, menu_size, menu_name, image, calorie, price, detail, sauce_no)"
					+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
			con = ds.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getM_class());
			stmt.setString(2, dto.getM_size());
			stmt.setString(3, dto.getM_name());
			stmt.setString(4, dto.getM_img());
			stmt.setInt(5, dto.getM_calorie());
			stmt.setInt(6, dto.getM_price());
			stmt.setString(7, dto.getM_detail());
			stmt.setString(8, dto.getM_recomsauce());
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("AddMenu() : " + err);
		}
		finally{
			freeConnection();
		}

	}
	
	
	public ArrayList MenuList(){
		ArrayList list = new ArrayList();
		String sql = "select menu_no, menu_name, image, price from menu";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				MenuDto dto = new MenuDto();
				dto.setM_no(rs.getInt("menu_no"));
				dto.setM_name(rs.getString("menu_name"));
				dto.setM_img(rs.getString("image"));
				dto.setM_price(rs.getInt("price"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("MenuList" + err);
		
		}finally{
			freeConnection();
		}
		return list;
	}
	
	//�󼼺���
	public MenuDto MenuDetailList(int menu_no){
		MenuDto dto = new MenuDto();
		String sql = "select image, class, menu_size, menu_name, calorie, price, detail, sauce_no from menu where menu_no=?";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, menu_no);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				dto.setM_img(rs.getString("image"));
				dto.setM_class(rs.getString("class"));
				dto.setM_size(rs.getString("menu_size"));
				dto.setM_name(rs.getString("menu_name"));
				dto.setM_calorie(rs.getInt("calorie"));
				dto.setM_price(rs.getInt("price"));
				dto.setM_detail(rs.getString("detail"));
				dto.setM_recomsauce(rs.getString("sauce_no"));
			}
			
		}catch(Exception err){
			System.out.println("MenuDetailList" + err);
		
		}finally{
			freeConnection();
		}
		return dto;
	}
	public void UpdateMenu(MenuDto dto){
		try{
			String sql = "update menu set class=?, menu_size=?, menu_name=?, image=?, calorie=?, price=?, detail=?, sauce_no=?"
					+ "where menu_no=?";
			con = ds.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getM_class());
			stmt.setString(2, dto.getM_size());
			stmt.setString(3, dto.getM_name());
			stmt.setString(4, dto.getM_img());
			stmt.setInt(5, dto.getM_calorie());
			stmt.setInt(6, dto.getM_price());
			stmt.setString(7, dto.getM_detail());
			stmt.setString(8, dto.getM_recomsauce());
			stmt.setInt(9, dto.getM_no());
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("UpdateMenu() : " + err);
		}
		finally{
			freeConnection();
		}

	}
	
	public void MenuDelete(int menu_no) {
		String sql = "delete from menu where menu_no=?";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, menu_no);
			stmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("MenuDelete" + err);
		
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

