<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<jsp:useBean id="dto" class="order.OrderDto"></jsp:useBean>
<%
	int account_no = Integer.parseInt(request.getParameter("account_no"));
	int store_no = Integer.parseInt(request.getParameter("store_no"));
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	int bread_no = Integer.parseInt(request.getParameter("bread_no"));
	String menu_size = request.getParameter("menu_size");
	String vegetable_no = request.getParameter("VegetableList");
	String sauce_no = request.getParameter("SelectSauceValue"); 
	
	
	
%>
