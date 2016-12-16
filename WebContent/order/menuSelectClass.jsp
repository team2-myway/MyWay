<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<%
	String menuclass = request.getParameter("class");
	String menusize = request.getParameter("size");
try {
	ArrayList menuList = dao.MenuSizeList(menusize, menuclass);
	for (int i = 0; i < menuList.size(); i++) {
		OrderDto dto = (OrderDto) menuList.get(i);
%>
	<div class="col-md-4" style="border-color: aqua; border: solid;">
		<div style="text-align: center">
			<input type="radio" name="menu_no" value="<%=dto.getMenu_no()%>" />
		</div>
		<div class="cmsms_our_team">
			<div class="wrap_person">
				<img src="<%=dto.getMenu_image()%>" class="fullwidth"
					alt="female-practitioner-s-1">
			</div>
			<hr>
			<div>
				<%=dto.getMenu_name()%> / <%=dto.getMenu_price()%>
				<hr>
				<span><%=dto.getMenu_detail()%></span>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=dto.getMenu_price()%>"/>
<%
}

} catch (Exception err) {
	System.out.println("menuSelectClass.jsp : " + err);
}

%>