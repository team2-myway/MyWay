<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myway.ReviewDao" />
<jsp:useBean id="dto" class="myway.ReviewDto" />
<%
   int review_no = Integer.parseInt(request.getParameter("review_no"));
   boolean deleteRs = dao.reviewDelete(review_no);
   
   if(deleteRs == true) {
%>
   <script>
      alert("삭제완료");
      location.href="review_List.jsp";
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
