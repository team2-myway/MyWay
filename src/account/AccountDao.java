package account;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class AccountDao {

		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		// private Statement stmt;

		private DataSource ds;

		public AccountDao() {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysqlDB");
			} catch (Exception e) {
				System.out.println("DB 연결실패 : " + e);
			}
		}
		
		public AccountDto session(Object session_id) {
			AccountDto dto = new AccountDto();
			String sql = "select account_no, account_name, level from account where id=?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, session_id.toString());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto.setAccount_no(rs.getInt("account_no"));
					dto.setAccount_name(rs.getString("account_name"));
					dto.setLevel(rs.getString("level"));
				}
			} catch (Exception e) {
				System.out.println("session() : " + e);
			} finally{
				freeConnection();
			}
			return dto;
		}

		public void addAccount(AccountDto dto) {
			try {
				String sql = "insert into account(level, id, pw, account_name, tel, email) values(?,?,?,?,?,?)";
				con = ds.getConnection();

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "customer");
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPw());
				pstmt.setString(4, dto.getAccount_name());
				pstmt.setString(5, dto.getTel1()+dto.getTel2()+dto.getTel3());
				pstmt.setString(6, dto.getEmail1()+"@"+dto.getEmail2());

				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("addAccount() : " + e);
			} finally {
				freeConnection();
			}
		}
		
		public void addManager(AccountDto dto) {
			try {
				String sql = "insert into account(level, id, pw, account_name, manager_area, manager_name, tel, email) values(?,?,?,?,?,?,?,?)";
				con = ds.getConnection();

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "manager");
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPw());
				pstmt.setString(4, dto.getAccount_name());
				pstmt.setString(5, dto.getManager_area());
				pstmt.setString(6, dto.getManager_name());
				pstmt.setString(7, dto.getTel1()+dto.getTel2()+dto.getTel3());
				pstmt.setString(8, dto.getEmail1()+"@"+dto.getEmail2());

				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("addAccount() : " + e);
			} finally {
				freeConnection();
			}
		}

		public AccountDto login(String id) {
			AccountDto adto = new AccountDto();
			String sql = "select account_no, pw from account where id=?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					adto.setPw(rs.getString("pw"));
					adto.setAccount_no(rs.getInt("account_no"));
				}
			} catch (Exception e) {
				System.out.println("login() : " + e);
			}
			return adto;
		}
		
		public AccountDto findID(String name,String email) {
			AccountDto adto = new AccountDto();
			String sql = "select id from account where account_name=? and email=?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					adto.setId(rs.getString("id"));
				}
			} catch (Exception e) {
				System.out.println("findID() : " + e);
			}
			return adto;
		}
		
		public AccountDto findByID(int account_no) {
			AccountDto adto = new AccountDto();
			String sql = "select * from account where account_no = ?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, account_no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					String[] str = rs.getString("email").split("@");
					adto.setId(rs.getString("id"));
					adto.setPw(rs.getString("pw"));
					adto.setAccount_name(rs.getString("account_name"));
					adto.setTel1(rs.getString("tel").substring(0, 3));
					adto.setTel2(rs.getString("tel").substring(3, 7));
					adto.setTel3(rs.getString("tel").substring(7, 11));
					adto.setEmail1(str[0]);
					adto.setEmail2(str[1]);
					adto.setStamp(rs.getInt("stamp"));
				}
			} catch (Exception e) {
				System.out.println("findByID() : " + e);
			}
			return adto;
		}
		
		public AccountDto findByPW(String id,String name,String email) {
			AccountDto adto = new AccountDto();
			String sql = "select * from account where id = ? and account_name=? and email=?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					adto.setAccount_no(rs.getInt("account_no"));
					adto.setPw(rs.getString("pw"));
				}
			} catch (Exception e) {
				System.out.println("findByPW() : " + e);
			}
			return adto;
		}
		
		public void updatePW(int no,String new_pw){
			String sql = "update account set pw=? where account_no = ?";			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, new_pw);
				pstmt.setInt(2, no);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("updatePW()"+e);
			} finally {
				freeConnection();
			}
		}
		public void updateAccount(AccountDto dto){
			String sql = "update account set pw=?, account_name=?, tel=?, email=? where account_no = ?";
			System.out.println(dto.getAccount_name());
			System.out.println(dto.getAccount_no());
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPw());
				pstmt.setString(2, dto.getAccount_name());
				pstmt.setString(3, dto.getTel1()+dto.getTel2()+dto.getTel3());
				pstmt.setString(4, dto.getEmail1()+"@"+dto.getEmail2());
				pstmt.setInt(5, dto.getAccount_no());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("updateAccount()"+e);
			} finally {
				freeConnection();
			}
		}
		/*
		public void editSawon(Sawon dto) {
			String sql = "update tblsawon set s_pass = ?,s_age=?,s_addr=?,s_dept=? where s_no = ?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getS_pass());
				pstmt.setInt(2, dto.getS_age());
				pstmt.setString(3, dto.getS_addr());
				pstmt.setString(4, dto.getS_dept());
				pstmt.setInt(5, dto.getS_no());
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("editSawon() : " + e);
			} finally {
				freeConnection();
			}
		}
*/
		/*
		public void delSawon(int no) {
			String sql = "delete from tblsawon where s_no =?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("delSawon() : " + e);
			}
		}
*/
		public void freeConnection() {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
	}