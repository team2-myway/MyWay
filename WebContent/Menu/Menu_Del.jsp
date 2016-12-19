
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

	String s_no = request.getParameter("s_no");
	String sql = "delete from tblsawon where s_no=?";  // menu db로 수정해야함
			
	Connection con = null;
	PreparedStatement stmt = null;
	DBConnectionMgr pool = null;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	try{
		pool = DBConnectionMgr.getInstance();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, "scott", "1111");
		stmt = con.prepareStatement(sql);
		stmt.setString(1, s_no);
		stmt.executeUpdate();
%>
	<script>
		alert("잘 삭제 되었습니다.");
		location.href="index.jsp";
	</script>
<% 	
		
	}
	catch(Exception err){
		System.out.println("delSawon_proc.jsp : " + err);    //
	}
	finally{
		
		if(stmt != null){try{stmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
%>


</body>
</html>