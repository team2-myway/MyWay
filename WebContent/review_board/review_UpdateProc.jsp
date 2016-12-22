<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myway.ReviewDao" />
<jsp:useBean id="dto" class="myway.ReviewDto" />

<jsp:setProperty property="review_no" name="dto"/>
<jsp:setProperty property="account_name" name="dto"/>
<jsp:setProperty property="manager_name" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="grade" name="dto"/>
<jsp:setProperty property="date" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%
   boolean updateResult = dao.reviewUpdate(dto);
   if(updateResult == true) {
%>
      <script>
         alert("수정되었습니다");
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