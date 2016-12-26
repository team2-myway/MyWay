<%@page import="Menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="Menu.dto.MenuDto" />
<jsp:useBean id="dao" class="Menu.dao.MenuDao" />
<%
	List menulist = dao.MenuList();
%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%><br><br>
		
		<center>
			
			<input type="button" value="SideMenu" onclick="location.href='SideMenuIndex.jsp?'" /></td>
		
		</center>
		<br><br>
		
		<div class="container">
			<div class="col-md-12">
				<div>
					<form>
						<table class="table"width=100% border=0 cellspacing=0 cellpadding=3>
						<tr>
							<th>이미지</th>
							<th>이름</th>
							<th>가격</th>
						
						</tr>
<%
							 for(int i=0; i<menulist.size(); i++) {
								 dto = (MenuDto)menulist.get(i);
								 
%>
							<tr>
								<td><img src="<%=dto.getM_img()%>">img</td>
								<td><a href="Menu_Detail.jsp?menu_no=<%=dto.getM_no()%>"><%=dto.getM_name() %></a></td>
								<td><%=dto.getM_price() %></td>
							</tr>
							
<%
							 }
%>

						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
		
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