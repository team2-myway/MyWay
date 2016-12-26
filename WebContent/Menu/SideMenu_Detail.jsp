<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="page">
<jsp:useBean id="dao" class="Menu.dao.SideMenuDao"></jsp:useBean>
<jsp:useBean id="dto" class="Menu.dto.SideMenuDto"></jsp:useBean>

	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
<%
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	dto = dao.SideMenuDetailList(menu_no);
					 
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
	<!-- 공간주기 -->
		<div style="height: 50px;">&nbsp;</div>
		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</section>
	<script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.js"></script>
		<!-- 공간주기 -->
		<div style="height: 50px;">&nbsp;</div>
		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</section>
	<script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.js"></script>
	
</body>
</html>