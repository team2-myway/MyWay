package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public StoreDao() { //������
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB"); //lookup() : �̸��� �˰� ������, jndi�� ������ �� �ִ�.
	
		} catch(Exception e) {
			System.out.println("DB���� ���� : " + e);
		} 
	}
	
	public ArrayList getStore_list(int account_no) {
		ArrayList list = new ArrayList();
		
		String sql = null;
		
		if(account_no == 1) { //super
			sql = "select * from account where level='super' or level='manager' order by account_no asc";
		} else { //manager
			sql = "select * from account where (level='super' or level='manager') and account_no=" + account_no;
		}
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StoreDto dto = new StoreDto();
				
				dto.setAccount_no(rs.getInt("account_no"));
				dto.setAccount_name(rs.getString("account_name"));
				dto.setManager_area(rs.getString("manager_area"));
				dto.setManager_name(rs.getString("manager_name"));
				dto.setTel(rs.getString("tel"));

				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getStore_list() : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}
	
	public ArrayList getStore_managerlist(int account_no) {
		ArrayList list = new ArrayList();
		String sql = null;
		
		sql = "select * from account where (level='super' or level='manager') and account_no=" + account_no;
				
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StoreDto dto = new StoreDto();
				
				dto.setAccount_no(rs.getInt("account_no"));
				dto.setAccount_name(rs.getString("account_name"));
				dto.setManager_area(rs.getString("manager_area"));
				dto.setManager_name(rs.getString("manager_name"));
				dto.setTel(rs.getString("tel"));

				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getStore_list() : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}
	
	public ArrayList getStore_detail(int account_no, String detail_date) {
		String sql = null;
		ArrayList list = new ArrayList();
		
		try{
			con = ds.getConnection();
			
			if(detail_date == null || detail_date.isEmpty() || detail_date.equals("total")) {
				sql = "select m.order_code, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.status='pay_com' and m.store_no=? order by m.date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date.equals("today")) {
				sql = "select m.order_code, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.status='pay_com' and  m.store_no=? and m.date>curdate() order by m.date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date.equals("month")) {
				sql = "select m.order_code, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.status='pay_com' and  m.store_no=? and date(m.date)>=date_format(now(), '%Y-%m-01') and date(m.date) <= last_day(now()) order by m.date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else {
				String[] date = detail_date.split("-");
				String date1 = date[0]+"-"+date[1]+"-"+date[2];
				String date2 = date[3]+"-"+date[4]+"-"+date[5];
				sql = "select m.order_code, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.status='pay_com' and  m.store_no=?and date(m.date)>=? and date(m.date)<=? order by m.date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
				pstmt.setDate(2, java.sql.Date.valueOf(date1));
				pstmt.setDate(3, java.sql.Date.valueOf(date2));
			}

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StoreDto dto = new StoreDto();
				
				dto.setOrder_code(rs.getString("order_code"));
				dto.setDate(rs.getDate("date"));
				dto.setTotal(rs.getInt("total"));
				dto.setStatus(rs.getString("status"));

				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getStore_detail() : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}
	
	public ArrayList getNoworder_list(int account_no) {
		String sql = null;
		ArrayList list = new ArrayList();
		
		try{
			con = ds.getConnection();
			
			sql = "select m.order_code, m.total, substr(m.date,1,16) date,a.account_name, d.count, menu.menu_name, side.count, sm.side_menu_name, m.status, "
					+ "side.price from main_order m "
					+ "left join detail_order d on m.order_code = d.order_code "
					+ "left join bread b on b.bread_no = d.bread_no"
					+ " left join side_order side on side.order_code = m.order_code "
					+ "left join side_menu sm on sm.side_menu_no = side.side_menu_no "
					+ "left join menu on menu.menu_no = d.menu_no"
					+ " left join account a on a.account_no = m.store_no where m.store_no=? and m.status='order_com';";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, account_no);			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StoreDto dto = new StoreDto();
				
				dto.setOrder_code(rs.getString("order_code"));
				dto.setDate(rs.getDate("date"));
				dto.setTotal(rs.getInt("total"));
				dto.setStatus(rs.getString("m.status"));
				dto.setMenu_name(rs.getString("menu.menu_name"));
				dto.setAccount_name(rs.getString("a.account_name"));

				dto.setMenu_price(rs.getInt("m.total"));
				dto.setMenu_count(rs.getInt("d.count"));
				dto.setOrder_date(rs.getString("date"));
				dto.setSide_menu_name(rs.getString("sm.side_menu_name"));
				dto.setSide_menu_count(rs.getInt("side.count"));
				dto.setSide_menu_countPirce(rs.getInt("side.price"));
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getNoworder_list() : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}
	
	public StoreDto getStore_total(int account_no, String detail_date) {
		String sql = null;
		StoreDto dto = new StoreDto();

		try{
			con = ds.getConnection();
			if(detail_date.equals("today")) {
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.store_no=? and status='pay_com' and m.date>curdate()";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date.equals("month")) {
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.store_no=? and status='pay_com' and date(m.date)>=date_format(now(), '%Y-%m-01') and date(m.date) <= last_day(now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date == null || detail_date.isEmpty() || detail_date.equals("total")) {
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.store_no=? and status='pay_com'";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else {
				String[] date = detail_date.split("-");
				String date1 = date[0]+"-"+date[1]+"-"+date[2];
				String date2 = date[3]+"-"+date[4]+"-"+date[5];
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where m.store_no=? and status='pay_com' and date(m.date)>=? and date(m.date)<=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
				pstmt.setDate(2, java.sql.Date.valueOf(date1));
				pstmt.setDate(3, java.sql.Date.valueOf(date2));
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setTotal(rs.getInt("total"));
			}
		}
		catch(Exception err){
			System.out.println("getStore_total() : " + err);
		}
		finally{
			freeConnection();
		}
		return dto;
	}
	
	public boolean updateOrderStatus(int account_no, String order_code) {
		boolean updateResult = false;
			try{
				con = ds.getConnection();
				
				String sql = "update main_order set status='pay_com' where store_no=? and order_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
				pstmt.setString(2, order_code);
				pstmt.executeUpdate();
				if(pstmt.executeUpdate() == 1) {
					updateResult = true;
				} else {
					updateResult = false;
				}
			}
			catch(Exception err){
				System.out.println("updateOrderStatus() : " + err);
			}
			finally{
				freeConnection();
			}
		return updateResult;
	}
	
	public void freeConnection() {
		if(rs != null) {try{ rs.close(); }catch(Exception e){}}
		if(pstmt != null) {try{ pstmt.close(); }catch(Exception e){}}
		if(con != null) {try{ con.close(); }catch(Exception e){}}
	}
}
