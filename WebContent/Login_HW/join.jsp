<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JOIN PAGE</title>
</head>
<script>
	function fncCheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var account = document.getElementById("account").checked;
		
		if (id.length<4) {
			alert("ID>3");
			return false;
		}else if(pw.length<4){
			alert("PW>3");
			return false;
		}else if(account==false){
			alert("Plz Check");
			return false;
		}
	}
</script>
<body>
	<form action="join_proc.jsp" name="joinform" method="get" onsubmit="return fncCheck()">
		<center>
			<table>
				<tr>
					<th><label>ID</label></th>
					<td><input type="text" id="id" value="id" /></td>
				</tr>
				<tr>
					<th><label>PW</label></th>
					<td><input type="text" id="pw" value="pw" /></td>
				</tr>
				<tr>
					<th><label>NAME</label></th>
					<td><input type="text" id="name" value="name" /></td>
				</tr>
				<tr>
					<th><label>TEL</label></th>
					<td><select id="tel1">
							<option selected="selected">010</option>
							<option>011</option>
							<option>012</option>
							<option>013</option>
					</select> - <input type="text" id="tel2" size="4"> - <input type="text"
						id="tel3" size="4" ></td>
				</tr>
				<tr>
					<th><label>E-MAIL</label></th>
					<td><input type="text" id="email1" size="10" /> @ <select
						id="email2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>bulabula.com</option>
							<option>holahola.com</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="5" cols="40">개인정보 동의</textarea></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="account">동의합니다</td>
				</tr>
				<tr align="center">
					<td><input type="submit" value="확인"/></td>
					<td><input type="button" value="GotoMain" onclick="javascript:location.href='main.jsp';" /></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>