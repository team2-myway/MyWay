<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="page">
<jsp:useBean id="dao" class="Menu.dao.MenuDao"></jsp:useBean>
<jsp:useBean id="dto" class="Menu.dto.MenuDto"></jsp:useBean>

	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
	
	
<%
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	dto = dao.MenuDetailList(menu_no);
							// for(int i=0; i<menulist.size(); i++) {
								// dto = (MenuDto)menulist.get(i);
								 
%>
<center>
<br><br>
	<tr>
		<td><%=dto.getM_name() %></td><br><br>
		<td><img src="<%=dto.getM_img()%>">img</td><br><br>
		
			<td valign="top" align=left>
					<text name="detail"><%=dto.getM_detail() %></text>
			</td><br><br>
		
	
		<td><span style="color:red"> 칼로리   </td>
		<td><%=dto.getM_calorie()%> kcal</span> </td> &nbsp;&nbsp;&nbsp; 
		<td>가격 </span> </td>
		<td><%=dto.getM_price() %> won</td> <br>
		
	
				
			
</tr>
</center>
</body>
</html>