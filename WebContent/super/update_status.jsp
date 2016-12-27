<%@page import="management.StoreDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../lib/js/jquery-3.1.1.min.js"></script>
</head>
<body class="page">
<jsp:useBean id="dao" class="management.StoreDao"></jsp:useBean>
<jsp:useBean id="dto" class="management.StoreDto"></jsp:useBean>
<%
	int account_no = Integer.parseInt(request.getParameter("account_no"));
	String order_code = request.getParameter("order_code");
	
	boolean update = dao.updateOrderStatus(account_no, order_code);
	if(update == true) {
%>
		<script>
			alert("결제 완료");
			location.href="store_detail.jsp?account_no="+<%=account_no%>;
		</script>
<%
	} else {
%>
	<script>
		alert("결제되지 않았습니다.");
		history.back();
	</script>
<%
	}

%>
</body>
</html>