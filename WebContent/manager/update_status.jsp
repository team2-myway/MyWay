<%@page import="management.StoreDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="../lib/js/jquery-3.1.1.min.js"></script>
</head>
<body class="page">
<jsp:useBean id="dao" class="management.StoreDao"></jsp:useBean>
<jsp:useBean id="dto" class="management.StoreDto"></jsp:useBean>
<%
	String account_no = request.getParameter("account_no");
	String order_no = request.getParameter("order_no");

	boolean update = dao.updateOrderStatus(account_no, order_no);
	if(update == true) {
%>
		<script>
			alert("결제 완료");
			location.href="store_detail.jsp";
		</script>
<%
	} else {
%>
	<script>
		alert("결제되지 않았습니다.");
		location.href="store_detail.jsp";
	</script>
<%
	}

%>
</body>
</html>