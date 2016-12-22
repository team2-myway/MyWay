<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/head.jsp"%>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<%
	String menuclass = request.getParameter("class");
	String menusize = request.getParameter("size");
try {
	ArrayList menuList = dao.MenuSizeList(menusize, menuclass);
	for (int i = 0; i < menuList.size(); i++) {
		OrderDto dto = (OrderDto) menuList.get(i);
%>
	<div class="col-md-4" style=" height:300px; text-align:center; ">
		<input type="radio" value="<%=dto.getMenu_no()%>" name="menu_no" onclick="Menu_Bestsauce()"><br>
		<article class="service type-service hentry one_fourth format-slider col-md-12">
			<figure>
				<span class="image_container_img">
					<span class="p_img_container">
						<img src="<%=dto.getMenu_image() %>" title="<%=dto.getMenu_name() %>"
								alt="Pediatric Clinic" class="fullwidth wp-post-image cmsms_img"
								style="opacity: 1;">
						<span class="image_rollover"></span>
					</span>
				</span>
			</figure>
			<div class="service_rollover" style="text-align:center;">
				<header class="entry-header" style="padding-bottom:10px;">
					<h5 class="entry-title" style="color:blue">
						<%=dto.getMenu_name() %>
					</h5>
				</header>
				<footer class="entry-meta">
					<span class="post_category">가격 : <b><%=dto.getMenu_price()%></b>원<br>
					 calorie :<b><%=dto.getMenu_calorie() %></b>
					</span>
				<div style="text-align:center">
					<p><%=dto.getMenu_detail() %></p>
				</div>
				</footer>
			</div>
		</article>
	</div>
	<input type="hidden" id="basic_price_<%=dto.getMenu_no()%>" value="<%=dto.getMenu_price()%>"/>
	<input type="hidden" id="menu_name_<%=dto.getMenu_no()%>" value="<%=dto.getMenu_name()%>"/>
<%
}

} catch (Exception err) {
	System.out.println("menuSelectClass.jsp : " + err);
}

%>

