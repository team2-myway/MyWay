<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="dto" class="account.AccountDto"></jsp:useBean>
	<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		dao.addAccount(dto);
	%>
	<script>
		alert("OK");
		location.href="../main/index.jsp"
	</script>
</body>
</html>