<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="Menu.dao.MenuDao"></jsp:useBean>
<%
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	dao.MenuDelete(menu_no);
%>

<script>
	alert("삭제완료");
	location.href="MenuIndex.jsp";
</script>
</body>
</html>