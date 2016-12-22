<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myway.ReviewDao" />
<jsp:useBean id="dto" class="myway.ReviewDto" />

<jsp:setProperty property="review_no" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%
    boolean insertResult = dao.insertComment(dto);
    if(insertResult == true) {
%>
      <script>
         alert("댓글이 등록되었습니다");
         location.href="review_List.jsp";
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