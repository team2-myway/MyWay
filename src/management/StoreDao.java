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
	
	public ArrayList getStore_list(String acc_no) {
		ArrayList list = new ArrayList();
		String sql = null;
		
		if(acc_no.equals("accountno")) {
			sql = "select * from account where level='super' or level='manager' order by account_no asc";
		} else {
			int account_no = Integer.parseInt(acc_no);
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
	
	public ArrayList getStore_detail(String acc_no, String detail_date) {
		int account_no = Integer.parseInt(acc_no);
		String sql = null;
		ArrayList list = new ArrayList();
		
		try{
			con = ds.getConnection();
			
			if(detail_date == null || detail_date.isEmpty() || detail_date.equals("total")) {
				sql = "select m.order_no, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' order by m.order_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date.equals("today")) {
				sql = "select m.order_no, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' and m.date>curdate() order by m.order_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date.equals("month")) {
				sql = "select m.order_no, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' and date(m.date)>=date_format(now(), '%Y-%m-01') and date(m.date) <= last_day(now()) order by m.order_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else {
				String[] date = detail_date.split("-");
				String date1 = date[0]+"-"+date[1]+"-"+date[2];
				String date2 = date[3]+"-"+date[4]+"-"+date[5];
				sql = "select m.order_no, m.date, m.total, m.status from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' and date(m.date)>=? and date(m.date)<=? order by m.order_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
				pstmt.setDate(2, java.sql.Date.valueOf(date1));
				pstmt.setDate(3, java.sql.Date.valueOf(date2));
			}

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StoreDto dto = new StoreDto();
				
				dto.setOrder_no(rs.getInt("order_no"));
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
	
	public StoreDto getStore_total(String acc_no, String detail_date) {
		int account_no = Integer.parseInt(acc_no);
		String sql = null;
		StoreDto dto = new StoreDto();

		try{
			con = ds.getConnection();
			if(detail_date.equals("today")) {
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' and m.date>curdate()";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date.equals("month")) {
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' and date(m.date)>=date_format(now(), '%Y-%m-01') and date(m.date) <= last_day(now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else if(detail_date == null || detail_date.isEmpty() || detail_date.equals("total")) {
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�'";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
			} else {
				String[] date = detail_date.split("-");
				String date1 = date[0]+"-"+date[1]+"-"+date[2];
				String date2 = date[3]+"-"+date[4]+"-"+date[5];
				sql = "select sum(m.total) as total from account a INNER JOIN main_order m ON a.account_no=m.account_no where a.account_no=? and status='�����Ϸ�' and date(m.date)>=? and date(m.date)<=?";
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
	
	public void freeConnection() {
		if(rs != null) {try{ rs.close(); }catch(Exception e){}}
		if(pstmt != null) {try{ pstmt.close(); }catch(Exception e){}}
		if(con != null) {try{ con.close(); }catch(Exception e){}}
	}
}