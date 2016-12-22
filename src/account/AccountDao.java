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

		/* 
		public ArrayList getSawonList(String search, String searchText) {
			ArrayList list = new ArrayList();
			String sql = null;

			if (searchText == null || searchText.isEmpty()) {
				sql = "select * from tblsawon";
			} else {
				sql = "select * from tblsawon where " + search + " like '%" + searchText + "%'";
			}
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Sawon s = new Sawon();
					s.setS_no(rs.getInt("s_no"));
					s.setS_id(rs.getString("s_id"));
					s.setS_name(rs.getString("s_name"));
					s.setS_pass(rs.getString("s_pass"));
					s.setS_age(rs.getInt("s_age"));
					s.setS_addr(rs.getString("s_addr"));
					s.setS_dept(rs.getString("s_dept"));

					list.add(s);
				}
			} catch (Exception e) {
				System.out.println("getSawonList() : " + e);
			} finally {
				freeConnection();
			}
			return list;
		}
		 */

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

		public AccountDto login(String id) {
			AccountDto adto = new AccountDto();
			String sql = "select pw from account where id=?";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					adto.setPw(rs.getString("pw"));
				}
			} catch (Exception e) {
				System.out.println("login() : " + e);
			}
			return adto;
		}
		public AccountDto findByID(String name,String email) {
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
				System.out.println("OK");
			} catch (SQLException e) {
				System.out.println("updatePW()"+e);
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
