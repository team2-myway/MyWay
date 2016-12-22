<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="account.AccountDto"></jsp:useBean>
	<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		if (dao.findID(name, email).getId() == null) {
	%>
	<script>
		alert("name, email not exist");
		window.close();
	</script>
	<%
		} else {
	%>
		<h3>당신의 아이디는</h3><br/>
		<strong><%=dao.findByID(name, email).getId() %></strong>
		<h3>입니다.</h3>
	<%
		}
	%>
</body>
</html>