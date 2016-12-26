<%@page import="Menu.dto.SideMenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="Menu.dto.SideMenuDto" />
<jsp:useBean id="dao" class="Menu.dao.SideMenuDao" />
<%
	List menulist = dao.SideMenuList();
%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<div>
					<form>
						<table class="table"width=100% border=0 cellspacing=0 cellpadding=3>
						<tr>
							<th>이미지</th>
							<th>이름</th>
							<th>가격</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
<%
							 for(int i=0; i<menulist.size(); i++) {
								 dto = (SideMenuDto)menulist.get(i);
								 
%>
							<tr>
								<td><img src="<%=dto.getM_img()%>">img</td>
								<td><a href="SideMenu_Detail.jsp?menu_no=<%=dto.getM_no()%>"><%=dto.getM_name() %></a></td>
								<td><%=dto.getM_price() %></td>
								<td><input type="button" value="수정" onclick="location.href='SideMenu_Edit.jsp?menu_no=<%=dto.getM_no()%>'" /></td>
								<td><input type="button" value="삭제" onclick="location.href='SideMenu_Del.jsp?menu_no=<%=dto.getM_no()%>'" /></td>
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