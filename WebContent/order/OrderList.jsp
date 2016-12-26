<%@page import="java.util.List"%>
<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<%
	//int account_no = (int)session.getAttribute("account_no");
	int account_no = 5;	

%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
		<h3> 나의 주문 내역 </h3>
		
		<table class="table table-striped">
			<tr>
				<th>No</th>
				<th>날짜</th>
				<th>메뉴</th>
				<th>세부선택사항</th>
				<th>적립내역</th>
			</tr>
			<%
				try {
					ArrayList OrderList = dao.MyOrderList(account_no,"orderlist");
					for (int i = 0; i < OrderList.size(); i++) {
					OrderDto dto = (OrderDto) OrderList.get(i);
					if(dto.getBread_name() != null){
				%>
					<tr>
						<td><%=(i+1)%></td>
						<td><%=dto.getOrder_date()%></td>
						<td><%=dto.getMenu_name()%></td>
						<td>
						<span>빵 : <%=dto.getBread_name()%></span><br>
						<span>채소 :
						 <%
							ArrayList VegetableList = dao.VegetableOrderList(dto.getVegetable_no_List());
							for(int j=0; j<VegetableList.size(); j++){
								%>
									<%=VegetableList.get(j)%>
								<%
							}
						%>
						</span><br>
						<span>소스 :
						 <%
							List SauceList = dao.SauceOrderList(dto.getSauce_no_List());
							for(int j=0; j<SauceList.size(); j++){
								%>
									<%=SauceList.get(j)%>
								<%
							}
						%>
						
						</span>
						</td>
						<td><%=dto.getMenu_count() %></td>
					</tr>
			<%
						}else{
							%>
							<tr>
								<td><%=(i+1)%></td>
								<td><%=dto.getOrder_date()%></td>
								<td><%=dto.getSide_menu_name()%></td>
								<td>
								<span>갯수 : <%=dto.getSide_menu_count() %></span><br>
								<span>총 가격 : <%=dto.getSide_menu_countPirce()%>
								</span><br>
								</td>
								<td>X</td>
							</tr>
					<%
						}
						}
					
					} catch (Exception err) {
						System.out.println("OrderList.jsp : " + err);
					}
			%>
		 </table>
		
		</div>
		<div style="height: 50px;">&nbsp;</div>
		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</section>
	<script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>