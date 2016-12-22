<%@page import="account.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
<%
	AccountDto dto = new AccountDto();
	System.out.print(session.getAttribute("account_no"));
	dto.setAccount_no((Integer)session.getAttribute("account_no"));
	dto.setPw(request.getParameter("pw"));
	dto.setAccount_name(request.getParameter("account_name"));
	dto.setTel1(request.getParameter("tel1"));
	dto.setTel2(request.getParameter("tel2"));
	dto.setTel3(request.getParameter("tel3"));
	dto.setEmail1(request.getParameter("email1"));
	dto.setEmail2(request.getParameter("email2"));
	System.out.print(dto.getAccount_name());
	dao.updateAccount(dto);
%>
<script>
	alert("update okay");
	location.href="../index.jsp";
</script>
</body>
</html>