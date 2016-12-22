<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<jsp:useBean id="dto" class="account.AccountDto"></jsp:useBean>
	<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		if (dao.login(id).getPw().equals(pw)) {
			response.sendRedirect("../index.jsp");
			session.setAttribute("id", id);
		} else {
	%>
	<script>
		alert("chk id or pw")
		location.href = "login.jsp";
	</script>

	<%
		}
	%>

</body>
</html>