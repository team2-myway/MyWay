<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myway.InquiryDao" />
<jsp:useBean id="dto" class="myway.InquiryDto" />

<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="category" name="dto"/>
<jsp:setProperty property="account_name" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%
	boolean insertResult = dao.insertBoard(dto);
	if(insertResult == true) {
%>
		<script>
			alert("등록되었습니다");
			location.href="inquiry_List.jsp";
		</script>
<%
	} else {
%>
		<script>
			location.href="inquiry_Post.jsp";
		</script>
<%		
	}
%>
