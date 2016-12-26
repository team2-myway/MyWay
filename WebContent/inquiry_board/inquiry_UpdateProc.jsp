<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="dao" class="inquiry.InquiryDao" />
<jsp:useBean id="dto" class="inquiry.InquiryDto" />

<jsp:setProperty property="board_no" name="dto"/>
<jsp:setProperty property="category" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%
	boolean updateResult = dao.inquiryUpdate(dto);
	if(updateResult == true) {
%>
		<script>
			alert("수정되었습니다");
			location.href="inquiry_List.jsp";
		</script>
<%
	} else {
%>
		<script>
			history.back();
		</script>
<%		
	}
%>
