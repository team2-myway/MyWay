<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="inquiry.InquiryDao"%>
<%@page import="inquiry.InquiryDto"%>

<% request.setCharacterEncoding("UTF-8");  %>
<jsp:useBean id="dao" class="inquiry.InquiryDao" />
<jsp:useBean id="childDto" class="inquiry.InquiryDto"/>
<jsp:setProperty property="*" name="childDto" />

<%
	InquiryDto parentDto = dao.getInquiryRead(childDto.getBoard_no());
	dao.replyUpdatePos(parentDto);
	
	childDto.setDepth(parentDto.getDepth());
	childDto.setPosition(parentDto.getPosition());
	boolean result = dao.replyBoard(childDto);
	if(result == true) {
%>
	<script>
	alert("답변을 등록하였습니다.");
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
