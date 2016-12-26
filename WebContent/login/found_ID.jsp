<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function popupOpen(form) {
		window.open("window_found_ID.jsp?name="+form.name.value+"&email="+form.email.value,"foundID","width=250 height=385 left=1500 top=100 directories=no location=no");
		
	}
</script>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
	<form name="form">
		<center>
			<table>
				<tr>
					<td><h2>Found ID/PW</h2></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" id="name" name="name" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" id="email" name="email" /></td>
				</tr>
				<tr>
					<td><input type="button" value="F_ID" onclick="popupOpen(form)"/></td>
					<td><input type="button" value="F_PW" onclick="javascript:location.href='found_PW.jsp'" /></td>
				</tr>
			</table>
		</center>
	</form>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>