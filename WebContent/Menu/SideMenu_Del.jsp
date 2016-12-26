<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="Menu.dao.SideMenuDao"></jsp:useBean>
<%
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	dao.SideMenuDelete(menu_no);
%>
<script>
	alert("삭제완료");
	location.href="SideMenuIndex.jsp";
</script>
</body>
</html>