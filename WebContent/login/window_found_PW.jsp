<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="account.AccountDto"></jsp:useBean>
<jsp:useBean id="dao" class="account.AccountDao"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<script>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	%>
	function fncCheck() {
		var pw1 = document.getElementById("new_pw1").value;
		var pw2 = document.getElementById("new_pw2").value;
		if (pw1 == pw2 && pw1 != null) {
			alert("비밀번호가 변경되었습니다.");
			return true;
			location.href="../login/login.jsp"
		} else {
			alert("pw1 != pw2");
			document.form.focus();
			return false;
		}
	}
</script>
<body>
	<%
		if (dao.findByPW(id, name, email).getPw() == null) {
	%>
	<script>
		alert("id or name or email not exist");
		window.close();
	</script>
	<%
		} else {
	%>
	<form action = "found_PW_proc.jsp" method="post" onsubmit="fncCheck();">
		<input type="hidden" name="account_no" value='<%=dao.findByPW(id, name, email).getAccount_no()%>'/>
		새 비밀번호 : <input type="text" id="new_pw1" name="new_pw1" /><br /> 
		새 비밀번호 확인 : <input type="text" id="new_pw2" name="new_pw2" /> 
		<input type="submit" value="비밀번호 변경"  />
	</form>
	<%
		}
	%>

</body>
</html>