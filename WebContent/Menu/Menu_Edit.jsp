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
<h1>��� ����</h1>
<form method="post" action="editSawon_proc.jsp">
	<input type="hidden" name="s_no" value="<%=s_Menu_no %>" />
	
	<table border="1">
		<tr>
			<td>���̵� : </td>
			<td><input type="text" name="s_id" value="<%=dto.getS_id()%>"/></td>
		</tr>
		<tr>
			<td>�̸� : </td>
			<td><input type="text" name="s_name" value="<%=dto.getS_name()%>"/></td>
		</tr>
		<tr>
			<td>���� : </td>
			<td><input type="text" name="s_age" value="<%=dto.getS_age()%>"/></td>
		</tr>
		<tr>
			<td>�н����� : </td>
			<td><input type="password" name="s_pass" value="<%=dto.getS_pass()%>"/></td>
		</tr>
		<tr>
			<td>�ٹ��� : </td>
			<td>
				<select name="s_addr">
					<option value="����" <%if(dto.getS_addr().equals("����")){%>selected="selected"<%}%>>����</option>
					<option value="����" <%if(dto.getS_addr().equals("����")){%>selected="selected"<%}%>>����</option>
					<option value="�λ�" <%if(dto.getS_addr().equals("�λ�")){%>selected="selected"<%}%>>�λ�</option>
					<option value="����" <%if(dto.getS_addr().equals("����")){%>selected="selected"<%}%>>����</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>�μ��� : </td>
			<td>
				<select name="s_dept">
					<option value="����" <%if(dto.getS_dept().equals("����")){%>selected="selected"<%}%>>����</option>
					<option value="���" <%if(dto.getS_dept().equals("���")){%>selected="selected"<%}%>>���</option>
					<option value="��ȹ" <%if(dto.getS_dept().equals("��ȹ")){%>selected="selected"<%}%>>��ȹ</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="����"/>&nbsp;&nbsp;&nbsp;
				<input type="reset" value="�ٽ� �ۼ�" />
			</td>
		</tr>
	</table>
</body>
</html>