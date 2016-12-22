<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="account.AccountDto"></jsp:useBean>
	<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
	<%
		request.setCharacterEncoding("euc-kr");
		int id = Integer.parseInt(request.getParameter("account_no"));
		String new_pw1 = request.getParameter("new_pw1");
		
		dao.updatePW(id, new_pw1);
	%>
	<script>
		alert("okay");
		window.close();
	</script>
</body>
</html>