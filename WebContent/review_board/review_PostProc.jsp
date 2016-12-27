<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="review.ReviewDao" />
<jsp:useBean id="dto" class="review.ReviewDto" />

<jsp:setProperty property="account_name" name="dto"/>
<jsp:setProperty property="manager_name" name="dto"/>
<jsp:setProperty property="account_no" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="grade" name="dto"/>
<jsp:setProperty property="date" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%

   boolean insertResult = dao.insertBoard(dto);
   if(insertResult == true) {
%>
      <script>
         alert("등록되었습니다");
         location.href="review_List.jsp";
      </script>
<%
   } else {
%>
      <script>
         alert("다시 작성해주세요");
         location.href="review_Post.jsp";
      </script>
<%      
   }
%>