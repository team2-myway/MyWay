<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<jsp:useBean id="dto" class="account.AccountDto"></jsp:useBean>
	<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		if (dao.login(id).getPw().equals(pw)) {
			response.sendRedirect("../main/index.jsp");
			session.setAttribute("id", id);
			session.setAttribute("account_no", dao.login(id).getAccount_no());
			// account_no까지
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