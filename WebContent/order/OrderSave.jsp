<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<jsp:useBean id="dto" class="order.OrderDto"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	//int account_no = Integer.parseInt(request.getParameter("account_no"));
	//int manage_no = Integer.parseInt(request.getParameter("store_no"));
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	int bread_no = Integer.parseInt(request.getParameter("bread_no"));
	String menu_size = request.getParameter("menu_size");
	String vegetable_no_List = request.getParameter("VegetableList");
	String sauce_no_List = request.getParameter("SelectSauceValue"); 
	int menu_count = Integer.parseInt(request.getParameter("count"));
	int menu_price = Integer.parseInt(request.getParameter("CountPirce"));
	String order_code = request.getParameter("order_code");
	String favorite = request.getParameter("favorite");
	
	

	//dto.setAccount_no(account_no);
	//dto.setManage_no(manage_no);
	dto.setMenu_no(menu_no);
	dto.setBread_no(bread_no);
	dto.setMenu_size(menu_size);
	dto.setVegetable_no_List(vegetable_no_List);
	dto.setSauce_no_List(sauce_no_List);
	dto.setMenu_count(menu_count);
	dto.setMenu_price(menu_price);
	dto.setOrder_code(order_code);
	dto.setFavorite(favorite);
	
	dao.DetailOrderSave(dto);
	
%>
