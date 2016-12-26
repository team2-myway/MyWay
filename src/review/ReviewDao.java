package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public ReviewDao() { 
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysqlDB");
		} catch (Exception e) {
			System.out.println("DB connect error: " + e);
		}
	}

	// ?��체�??���?(List.jsp)
	public ArrayList getBoardList(String keyField, String keyWord) {
		ArrayList list = new ArrayList();
		String sql = null;

		if (keyWord == null || keyWord.isEmpty()) {
			sql = "select * from review_board order by review_no desc";
		} else {
			sql = "select * from review_board where " + keyField + " like '%" + keyWord + "%' order by review_no desc";
		}

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();

				dto.setReview_no(rs.getInt("review_no"));
				dto.setAccount_name(rs.getString("account_name"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getDate("date"));
				dto.setGrade(rs.getString("grade"));

				list.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getBoardList() : " + err);
		} finally {
			freeConnection();
		}

		return list;
	}

	// �??���?
	public boolean insertBoard(ReviewDto dto) {
		boolean result = false;
		String sql = "insert into review_board(account_no, account_name, manager_name, title, date, grade, content) values(?,?,?,?,now(),?,?)";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getAccount_no());
			pstmt.setString(2, dto.getAccount_name());
			pstmt.setString(3, dto.getManager_name());
			pstmt.setString(4, dto.getTitle());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getContent());

			// pstmt.executeUpdate();
			if (pstmt.executeUpdate() == 1) { // �������� ����Ǹ�? 1�� ���ϵ�
				result = true;
			}
		} catch (Exception err) {
			System.out.println("insertBoard() : " + err);
		} finally {
			freeConnection();
		}
		return result;
	}

	// �??���?
	public ReviewDto getReviewRead(String review_no) {
		ReviewDto dto = new ReviewDto();
		String sql = null;

		try {
			con = ds.getConnection();
			sql = "select review_no, account_name, manager_name, title, content, date, grade from review_board where review_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(review_no));
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setReview_no(rs.getInt("review_no"));
				dto.setAccount_name(rs.getString("account_name"));
				dto.setManager_name(rs.getString("manager_name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setGrade(rs.getString("grade"));
			}
		} catch (Exception err) {
			System.out.println("getReviewRead() : " + err);
		} finally {
			freeConnection();
		}
		return dto;
	}

	public boolean reviewUpdateChk(String account_no, String pw) {
		boolean updateRs = false;
			
		String check_pw = pw; //?��?��?�� �?
		String sql = null;
		String pass = null; //db 계정?�� pw
			
		try{
			con = ds.getConnection();
			sql = "select pw from account where account_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(account_no));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString("pw");
				if(pass.equals(check_pw)) {
					updateRs = true;
				} else {
					updateRs = false;
				}
			}
		} catch(Exception e) {
			System.out.println("reviewUpdateChk() : " + e);
		} finally {
			freeConnection();
		}
		return updateRs;
	}
	
	// �??��?��
	public boolean reviewUpdate(ReviewDto dto) {
		String sql = null;
		boolean updateRs = false;
		try {
			con = ds.getConnection();
			sql = "update review_board set manager_name=?, title=?, content=?, grade=? where review_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getManager_name());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getGrade());
			pstmt.setInt(5, dto.getReview_no());
			pstmt.executeUpdate();

			if (pstmt.executeUpdate() == 1) {
				updateRs = true;
			} else {
				updateRs = false;
			}
		} catch (Exception err) {
			System.out.println("reviewUpdate() : " + err);
		} finally {
			freeConnection();
		}
		return updateRs;
	}

	//�? ?��?��(Delete.jsp)
	public boolean reviewDelete(String account_no, String pw, String review_no) {
		boolean deleteRs = false;
			
		String check_pw = pw; //?��?��?�� �?
		String sql = null;
		String pass = null; //db 계정?�� pw
				
		try{
			con = ds.getConnection();
			sql = "select pw from account where account_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(account_no));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString("pw");
				if(pass.equals(check_pw)) {
					sql = "delete from review_board where review_no=?";		
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(review_no));
					pstmt.executeUpdate();
					deleteRs = true;
				} else {
					deleteRs = false;
				}
			}
		} catch(Exception e) {
			System.out.println("reviewDelete() : " + e);
		} finally {
			freeConnection();
		}
		return deleteRs;
	}
		
	// ?���??���?
	public ArrayList getCommentRead(String reviewno){
	  ArrayList list = new ArrayList();
	  int review_no = Integer.parseInt(reviewno);
	  String sql = null;

	      try{
	    	  con = ds.getConnection();
	          sql = "select a.account_name, r.content, r.date from account a INNER JOIN review_comment r ON a.account_no=r.account_no where r.review_no="+review_no;
	          pstmt = con.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	          
	          while(rs.next()){
	        	  ReviewDto dto = new ReviewDto();  
	        	  
	        	  dto.setAccount_name(rs.getString("account_name"));
	         	  dto.setContent(rs.getString("content"));
	         	  dto.setDate(rs.getDate("date"));
	              
	         	  list.add(dto);
	          }
	      }
	      catch(Exception err){
	         System.out.println("getCommentRead() : " + err);
	      }
	      finally{
	         freeConnection();
	      }
	      return list;
   }

	// ?���??���?
	public boolean insertComment(ReviewDto dto) {
		boolean result = false;
		String sql = "insert into review_comment (account_no, account_name, review_no, content, date) values(?,?,?,?,now())";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1); // ?��?�� account_no
			pstmt.setString(2, "?��?��?��"); //?��?�� account_name.. ?��?��?��?�� 받아?���?
			pstmt.setInt(3, dto.getReview_no());
			pstmt.setString(4, dto.getContent());

			//pstmt.executeUpdate();
			if (pstmt.executeUpdate() == 1) { // �������� ����Ǹ�? 1�� ���ϵ�
				result = true;
			}
		} catch (Exception err) {
			System.out.println("insertComment() : " + err);
		} finally {
			freeConnection();
		}
		return result;
	}

	// �??��
	public ArrayList getManagerArea() {
		ArrayList list = new ArrayList();
		String sql = null;

		try {
			con = ds.getConnection();
			sql = "SELECT manager_area FROM account where level = 'super' or level = 'manager' group by manager_area";
			pstmt = con.prepareStatement(sql);				
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setManager_area(rs.getString("manager_area"));
				list.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getManagerArea() : " + err);
		} finally {
			freeConnection();
		}
		return list;
	}
	
	// 매장
	public ArrayList getManagerName(String manager_area) {
		ArrayList list = new ArrayList();
		String sql = null;

		try {
			con = ds.getConnection();
			sql = "SELECT account_no, manager_name FROM account where (level = 'super' or level = 'manager') and manager_area=?";
			pstmt = con.prepareStatement(sql);				
			pstmt.setString(1, manager_area);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setAccount_no(rs.getInt("account_no"));
				dto.setManager_name(rs.getString("manager_name"));
				list.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getManagerName() : " + err);
		} finally {
			freeConnection();
		}
		return list;
	}
	
	//???��?�� ?��?��?���? 불러?���?
	public ReviewDto selectManagerArea(String manager_name) {
		ArrayList list = new ArrayList();
		String sql = null;
		ReviewDto dto = new ReviewDto();

		try {
			con = ds.getConnection();
			sql = "SELECT manager_area FROM account where manager_name=?";
			pstmt = con.prepareStatement(sql);				
			pstmt.setString(1, manager_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setManager_area(rs.getString("manager_area"));
			}
		} catch (Exception err) {
			System.out.println("selectManagerArea() : " + err);
		} finally {
			freeConnection();
		}
		return dto;
	}
	
	public void freeConnection() {
		if (rs != null) {try { rs.close(); } catch (Exception err) {} }
		if (pstmt != null) { try { pstmt.close(); } catch (Exception err) {} }
		if (con != null) { try { con.close(); } catch (Exception err) {} }
	}
}