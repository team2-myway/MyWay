<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="Menu.dao.MenuDao"/>
<h1>사원 수정</h1>
<form method="post" action="editSawon_proc.jsp">
	<input type="hidden" name="s_no" value="<%=s_Menu_no %>" />
	
	<table border="1">
		<tr>
			<td>아이디 : </td>
			<td><input type="text" name="s_id" value="<%=dto.getS_id()%>"/></td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td><input type="text" name="s_name" value="<%=dto.getS_name()%>"/></td>
		</tr>
		<tr>
			<td>나이 : </td>
			<td><input type="text" name="s_age" value="<%=dto.getS_age()%>"/></td>
		</tr>
		<tr>
			<td>패스워드 : </td>
			<td><input type="password" name="s_pass" value="<%=dto.getS_pass()%>"/></td>
		</tr>
		<tr>
			<td>근무지 : </td>
			<td>
				<select name="s_addr">
					<option value="서울" <%if(dto.getS_addr().equals("서울")){%>selected="selected"<%}%>>서울</option>
					<option value="광주" <%if(dto.getS_addr().equals("광주")){%>selected="selected"<%}%>>광주</option>
					<option value="부산" <%if(dto.getS_addr().equals("부산")){%>selected="selected"<%}%>>부산</option>
					<option value="제주" <%if(dto.getS_addr().equals("제주")){%>selected="selected"<%}%>>제주</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>부서명 : </td>
			<td>
				<select name="s_dept">
					<option value="영업" <%if(dto.getS_dept().equals("영업")){%>selected="selected"<%}%>>영업</option>
					<option value="기술" <%if(dto.getS_dept().equals("기술")){%>selected="selected"<%}%>>기술</option>
					<option value="기획" <%if(dto.getS_dept().equals("기획")){%>selected="selected"<%}%>>기획</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정"/>&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시 작성" />
			</td>
		</tr>
	</table>
</body>
</html>