<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/head.jsp"%>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<%
	String category = request.getParameter("category");
try {
	ArrayList SidemenuList = dao.SideMenuList(category);
	for (int i = 0; i < SidemenuList.size(); i++) {
		OrderDto dto = (OrderDto) SidemenuList.get(i);
%>
	<div class="col-md-9 checkbox" style="height:180px; text-align:center; padding-top:20px;">
		<div class="col-md-3">
			<input type="checkbox" value="<%=dto.getSide_menu_no()%>" id="side_menu_no_<%=dto.getSide_menu_no()%>" name="side_menu_no[]" onclick="SelCheckbox('<%=dto.getSide_menu_no()%>')"><br>
		</div>
		<div class="col-md-9">
			<img style="width:150%"src="<%=dto.getSide_menu_img()%>">
		</div>		
	</div>
	<input type="hidden" id="sidebasic_price_<%=dto.getSide_menu_no()%>" value="<%=dto.getSide_menu_price()%>"/>
	<input type="hidden" id="sidemenu_name_<%=dto.getSide_menu_no()%>" value="<%=dto.getSide_menu_name()%>"/>
<%
}

} catch (Exception err) {
	System.out.println("menuSelectClass.jsp : " + err);
}

%>

