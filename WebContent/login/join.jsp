<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN PAGE</title>
</head>
<script>
	function fncCheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var accept = document.getElementById("accept").checked;

		if (id.length < 4) {
			alert("ID>3");
			document.joinform.id.focus();
		} else if (pw.length < 4) {
			alert("PW>3");
			document.joinform.pw.focus();
		} else if (accept == false) {
			alert("Plz Check");
		} else {
			document.joinform.submit();
			return true;
		}
	}
</script>
<body>
	<jsp:include page="../include/head.jsp"></jsp:include>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<form action="join_proc.jsp" name="joinform" method="post" onsubmit="fncCheck();return false">
			<table>
				<tr>
					<th><label>ID</label></th>
					<td><input type="text" id="id" name="id" /></td>
				</tr>
				<tr>
					<th><label>PW</label></th>
					<td><input type="password" id="pw" name="pw" value="pw" /></td>
				</tr>
				<tr>
					<th><label>이름</label></th>
					<td><input type="text" id="account_name" name="account_name" /></td>
				</tr>
				<tr>
					<th><label>TEL</label></th>
					<td>
					<select id="tel1" name="tel1">
							<option selected="selected">010</option>
							<option>011</option>
							<option>012</option>
							<option>013</option>
					</select>
					</td><td> - <input type="text" id="tel2" name="tel2"> </td> 
					<td> - <input type="text" id="tel3" name="tel3"></td>
				</tr>
				<tr>
					<th><label>E-MAIL</label></th>
					<td><input type="text" id="email1" name ="email1" size="10" /> </td>
					<td> @ <select id="email2" name="email2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>bulabula.com</option>
							<option>holahola.com</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="5" cols="40" readonly="readonly">개인정보 동의</textarea></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="accept" name="accept">동의합니다</td>
				</tr>
				<tr align="center">
					<td><input type="submit" value="확인" /></td>
					<td><input type="button" value="GotoMain"
						onclick="javascript:location.href='../main/index.jsp';" /></td>
				</tr>
			</table>
	</form>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>