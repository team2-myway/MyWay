<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<%
	int account_no = (int)session.getAttribute("account_no");
	
%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
		<table class="table table-striped">
			<tr>
				<th>No</th>
				<th>날짜</th>
				<th>메뉴</th>
				<th>세부선택사항</th>
				<th>적립내역</th>
			</tr>
			<%
				
			
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