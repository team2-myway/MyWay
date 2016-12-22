<%@page import="account.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int account_no = (Integer)session.getAttribute("account_no");
%>
<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>

<%
	AccountDto list = dao.findByID(account_no);
%>
<body>
	<form action="update_account_proc.jsp" method="post">
	<input type="hidden" name="account_no" value='<%=list.getAccount_no() %>'/>
		<center>
			<table>
				<tr>
					<td><h2>회원 정보 수정</h2></td>
				</tr>
				<tr>
					<th><label>ID</label></th>
					<td><input type="text" id="id" name="id" value=<%=list.getId()%>
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th><label>PW</label></th>
					<td><input type="password" id="pw" name="pw" value=<%=list.getPw()%> /></td>
				</tr>
				<tr>
					<th><label>NAME</label></th>
					<td><input type="text" id="account_name" name="account_name"
						value=<%=list.getAccount_name()%> /></td>
				</tr>
				<tr>
					<th><label>TEL</label></th>
					<td><select id="tel1" name="tel1">
							<option value="010" <%if (list.getTel1().equals("010")) {%>
								selected="selected" <%}%>>010</option>
							<option value="011" <%if (list.getTel1().equals("011")) {%>
								selected="selected" <%}%>>011</option>
							<option value="012" <%if (list.getTel1().equals("012")) {%>
								selected="selected" <%}%>>012</option>
							<option value="013" <%if (list.getTel1().equals("013")) {%>
								selected="selected" <%}%>>013</option>
					</select></td>
					<td>- <input type="text" id="tel2" name="tel2" value=<%=list.getTel2()%>>
					</td>
					<td>- <input type="text" id="tel3" name="tel3" value=<%=list.getTel3()%>></td>
				</tr>
				<tr>
					<th><label>E-MAIL</label></th>
					<td><input type="text" id="email1" name="email1" value=<%=list.getEmail1()%>
						size="10" /></td>
					<td>@ <select id="email2" name="email2">
							<option value="naver.com"<%if (list.getEmail1().equals("naver.com")) {%>
								selected="selected" <%}%>>naver.com</option>
							<option value="daum.net"<%if (list.getEmail1().equals("daum.net")) {%>
								selected="selected" <%}%>>daum.net</option>
							<option value="gmail.com"<%if (list.getEmail1().equals("gmail.com")) {%>
								selected="selected" <%}%>>gmail.com</option>
							<option value="bulabula.com"<%if (list.getEmail1().equals("bulabula.com")) {%>
								selected="selected" <%}%>>bulabula.com</option>
							<option value="holahola.com"<%if (list.getEmail1().equals("holahola.com")) {%>
								selected="selected" <%}%>>holahola.com</option>
					</select></td>
				</tr>
				<tr>
					<td><input type="text" id="stamp" name="stamp" value=<%=list.getStamp()%>
						readonly="readonly" /> 개
				</tr>
				<tr align="center">
					<td><input type="submit" value="수정완료" /></td>
					<td><input type="button" value="GotoMain"
						onclick="javascript:location.href='../index.jsp';" /></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>