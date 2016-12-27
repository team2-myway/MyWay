<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="review.ReviewDao" />
<jsp:useBean id="dto" class="review.ReviewDto" />

<jsp:setProperty property="review_no" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<jsp:setProperty property="account_no" name="dto"/>
<jsp:setProperty property="account_name" name="dto"/>

<%
    boolean insertResult = dao.insertComment(dto);
    if(insertResult == true) {
%>
      <script>
         alert("댓글이 등록되었습니다");
         location.href="review_Read.jsp?account_no=5&review_no=1";
      </script>
<%
    } else {
%>
      <script>
         alert("다시 작성해주세요");
         history.back();
      </script>
<%      
    }
%>