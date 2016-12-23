<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myway.InquiryDao" />
<jsp:useBean id="dto" class="myway.InquiryDto" />
<%
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	boolean deleteRs = dao.inquiryDelete(board_no);
	
	if(deleteRs == true) {
%>
	<script>
		alert("삭제완료");
		location.href="inquiry_List.jsp";
	</script>
<%
		
		//response.sendRedirect("review_List.jsp");
	} else {
%>
	<script>
		alert("삭제되지 않았습니다");
		history.back();
	</script>
<%
	}
%>

