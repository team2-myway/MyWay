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
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id = "dto" class="Menu.dto.MenuDto" />
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="Menu.dao.MenuDao" />
<%
	dao.Menu_Add(dto);
%>
	<script>
		alert("추가 되었습니다.");
		location.href="index.jsp";
	
	</script>
<%		
		

%>
</body>
</html>