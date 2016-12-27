package inquiry;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class InquiryDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	   
	public InquiryDao(){ //������
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB"); //lookup() : �̸��� �˰� ������, jndi�� ������ �� �ִ�.
		} catch(Exception e) {
			System.out.println("DB���� ���� : " + e);
		} 
	}

	// ��ü�� ��ȸ(List.jsp)
	public ArrayList getBoardList(String keyField, String keyWord){
		ArrayList list = new ArrayList();
		String sql = null;
		
		if(keyWord == null || keyWord.isEmpty()){
			sql = "select * from inquiry_board order by position asc, board_no asc";
		}
		else{
			sql = "select * from inquiry_board where " + keyField + " like '%" + keyWord + "%' order by position asc, board_no asc";
		}
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				InquiryDto dto = new InquiryDto();
				
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setCategory(rs.getString("category"));
				dto.setAccount_name(rs.getString("account_name"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getDate("date"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() : " + err);
		}
		finally{
			freeConnection();
		}
		
		return list;
	}
	
	//pos ������
	private void updatePos(Connection con){
		try {
			String sql = "update inquiry_board set position=position+1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} 
		catch (Exception err) {
			System.out.println("updatePos : " + err);
		}
	}
	
	
	public boolean insertBoard(InquiryDto dto) {
		boolean result = false;
		String sql = "insert into inquiry_board(account_no, account_name, title, date, category, content, depth, position) values(?,?,?,now(),?,?,?,?)";

		try{
			con = ds.getConnection();
			
			updatePos(con);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getAccount_no()); 
			pstmt.setString(2, dto.getAccount_name());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getDepth());
			pstmt.setInt(7, dto.getPosition());

			//pstmt.executeUpdate();
			if(pstmt.executeUpdate() == 1) { //�������� ����Ǹ� 1�� ���ϵ�
				result = true;
			}			
		} catch(Exception err){
			System.out.println("insertBoard() : " + err);
		} finally{
			freeConnection();
		}
		return result;
	}
	
	//���б�
	public InquiryDto getInquiryRead(int board_no){
		InquiryDto dto = new InquiryDto();	
		String sql = null;
		
		try{
			con = ds.getConnection();
			sql = "select board_no, title, category, content, date from inquiry_board where board_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));			
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
			}
		}
		catch(Exception err){
			System.out.println("getInquiryRead() : " + err);
		}
		finally{
			freeConnection();
		}
		return dto;
	}
	
	public boolean inquiryUpdateChk(String account_no, String pw) {
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
			System.out.println("inquiryUpdateChk() : " + e);
		} finally {
			freeConnection();
		}
		return updateRs;
	}
	
	//�ۼ���
	public boolean inquiryUpdate(InquiryDto dto){
		String sql = null;
		boolean updateRs = false;
		try{
			con = ds.getConnection();
			sql = "update inquiry_board set category=?, title=?, content=?, date=now() where board_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBoard_no());
			pstmt.executeUpdate();
			
			if(pstmt.executeUpdate() == 1) {
				updateRs = true;
			} else {
				updateRs = false;
			}
		}
		catch(Exception err){
			System.out.println("inquiryUpdate() : " + err);
		}
		finally{
			freeConnection();
		}
		return updateRs;
	}
	
	public boolean inquiryDelete(String account_no, String pw, String board_no) {
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
					sql = "delete from inquiry_board where board_no=?";		
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(board_no));
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
	
	
	//�亯�ޱ��� �θ���� pos����ū pos�� 1 ������
	public void replyUpdatePos(InquiryDto dto){
		try {
			con = ds.getConnection();
			String sql = "update inquiry_board set position=position+1 where position>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPosition());
			pstmt.executeUpdate();			
		} 
		catch (Exception err) {
			System.out.println("replyUpdatePos : " + err);
		}
		finally{
			freeConnection();
		}
		
	}
	
	//�亯 �ޱ�
	public boolean replyBoard(InquiryDto dto){
		boolean result = false;
		try{
				con = ds.getConnection();

				String sql = "insert into Inquiry_board(account_no, account_name, title, date, category, content, depth, position) values(?,?,?,now(),?,?,?,?)";
				
				updatePos(con);
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, 1); //�ӽ� account_no�Դϴ�
				pstmt.setString(2, dto.getAccount_name());
				pstmt.setString(3, dto.getTitle());
				pstmt.setString(4, dto.getCategory());
				pstmt.setString(5, dto.getContent());
				pstmt.setInt(6, dto.getDepth()+1);
				pstmt.setInt(7, dto.getPosition()+1);
				
				if(pstmt.executeUpdate() == 1) {
					result = true;
				}
			}
			catch(Exception err){
				System.out.println("replyBoard : " + err);
			}
			finally{
				freeConnection();
			}
			return result;
		}		
	
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
}
