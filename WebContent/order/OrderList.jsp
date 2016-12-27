<%@page import="java.util.List"%>
<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<%
	String StartDate = request.getParameter("StartDate");
	String EndDate = request.getParameter("EndDate");
	int account_no = (Integer)session.getAttribute("account_no");
	//int account_no = 5;	
	ArrayList OrderList = dao.MyOrderList(account_no,"orderlist",StartDate,EndDate);
	
	int totalRecord = 0; //전체 글의 갯수
	int numPerPage = 7; //한페이지당 글의 개수
	int pagePerBlock = 3; //한 블럭 당 페이지 수
	int totalPage = 0; //전체 페이지 수
	int totalBlock = 0; //전체 블록의 수
	int nowPage = 0; //현재 페이지 번호
	int nowBlock = 0; //현재 블럭 번호
	int beginPerPage = 0; //페이지당 시작번호

	totalRecord = OrderList.size();
	totalPage = (int) Math.ceil(((double) totalRecord / numPerPage));
	totalBlock = (int) Math.ceil(((double) totalPage / pagePerBlock));

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	if (request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	}

	beginPerPage = nowPage * numPerPage;

	
%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
		<h3> 나의 주문 내역 </h3>
			<div class="row">
				<div class="col-md-12" style="text-align:right">
				<form method="post" action="OrderList.jsp" name="search">
					<p>조회기간:
					  <input type="text" style="width:150px;" id="StartDate" name="StartDate"/> ~  
					  <input type="text" style="width:150px;" id="EndDate" name="EndDate"/>
					<button type="submit" value="검색" class="btn btn-info" onclick="check()">
						<span class="glyphicon glyphicon-search"></span>
					</button>
					</p>
				</form>
				</div>
			</div>
			
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
					for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
						if (i == totalRecord){
							break;
						}
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
		<div class="col-md-12" style="text-align:center">
			<table>
					<tr>
							<td align="left">Go to Page &nbsp;&nbsp;&nbsp;&nbsp; 
	<%
	 						if (nowBlock > 0) {
	%> 
	 						<a href="OrderList.jsp?nowPage=<%=(nowBlock - 1) * pagePerBlock%>&nowBlock=<%=(nowBlock - 1)%>">이전 <%=pagePerBlock%>개
							</a>:::&nbsp;&nbsp;&nbsp; 
	<%
	 						}
	%> 
	<%
	 						for (int i = 0; i < pagePerBlock; i++) {
	 							if ((nowBlock * pagePerBlock) + i == totalPage)
	 								break;
	 %> 
	 							<a href="OrderList.jsp?nowPage=<%=i + (nowBlock * pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i + 1 + (nowBlock * pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
	<%
							}
							if (totalBlock > nowBlock + 1) {
	%>
								&nbsp;&nbsp;&nbsp;:::<a href="OrderList.jsp?nowPage=<%=(nowBlock + 1) * pagePerBlock%>&nowBlock=<%=(nowBlock + 1)%>">다음
								<%=pagePerBlock%>개 </a> 
	<%
	 						}
	%>
							</td>
						</tr>
			</table>
		</div>
		
		</div>
		<div style="height: 50px;">&nbsp;</div>
		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</section>
	<script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.js"></script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script>
	  $.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	  });
	
	  $(function() {
	    $("#StartDate, #EndDate").datepicker();
	    
	  });
		
	  function check(){
			document.search.submit();
		}
	  
	</script>

</body>
</html>