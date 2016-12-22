<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<script>
	function fncCheck(){
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		
		if (id.length==0) {
			alert("ID!!!!");
			document.loginform.id.focus();
		}else if(pw.length==0){
			alert("PW!!!!");
			document.loginform.pw.focus();
		}else{
			document.loginform.submit();
			return true;
		}
	}
</script>
<body>
<jsp:include page="../include/head.jsp"></jsp:include>
<jsp:include page="../include/header.jsp"></jsp:include>
	<form action="login_proc.jsp" name="loginform" method="post" onsubmit="fncCheck();return false">
		<center>
			<table>
				<tr>
					<td><h2>Login</h2></td>
				</tr>
				<tr>
					<td><label>ID</label></td>
					<td><input type="text" name="id" id="id" />
					<td rowspan="2"><input type="submit" value="submit" />
				</tr>
				<tr>
					<td><label>PW</label></td>
					<td><input type="password" name="pw" id="pw" />
				</tr>
				<tr>
					<td><a href="found_ID.jsp">ID/PW 찾기</a></td>
					<td><a href="join.jsp">회원가입</a></td>
				</tr>
			</table>
		</center>
	</form>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>