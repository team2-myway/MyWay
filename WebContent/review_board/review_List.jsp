<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css"
   type="text/css" charset="utf-8" />
<script
   src="../lib/daumeditor/js/editor_loader.js?environment=development"
   type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
   function check(){
      if(document.search.keyWord.value == ""){
         alert("검색어를 입력하세요.");
         document.search.keyWord.focus();
         return;
      }
      document.search.submit();
   }
</script>
</head>
<body class="page">
   <jsp:useBean id="dao" class="review.ReviewDao" />
   <%
      request.setCharacterEncoding("UTF-8");
      String keyField = request.getParameter("keyField");
      String keyWord = request.getParameter("keyWord");
      List list = dao.getBoardList(keyField, keyWord);
	  AccountDao ad = new AccountDao();
	  AccountDto accountdto = ad.session(session.getAttribute("id"));
      //////////////////////////////////////////////
      // Paging 기법

      int totalRecord = 0; // 전체 글의 갯수
      int numPerPage = 5; // 한 페이지 당 보여질 글의 갯수
      int pagePerBlock = 3; // 한 블럭 당 페이지 수
      int totalPage = 0; // 전체 페이지 수
      int totalBlock = 0; // 전체 블록의 수
      int nowPage = 0; // 현재 페이지 번호
      int nowBlock = 0; // 현재 블럭 번호
      int beginPerPage = 0; // 페이지 당 시작번호

      totalRecord = list.size();
      totalPage = (int) Math.ceil(((double) totalRecord / numPerPage));
      totalBlock = (int) Math.ceil(((double) totalPage / pagePerBlock));

      if (request.getParameter("nowPage") != null)
         nowPage = Integer.parseInt(request.getParameter("nowPage"));

      if (request.getParameter("nowBlock") != null)
         nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

      beginPerPage = nowPage * numPerPage;
   %>
   <section id="page" class="csstransition cmsms_resp hfeed site">
      <%@ include file="../include/header.jsp"%>
      <div class="container">
         <div class="col-md-12">
            <div class="col-md-12">
               <form action="review_List.jsp" name="search" method="post">
                  <table width=80% align=center cellpadding=4 cellspacing=0>
                     <tr>
                        <td align=right valign=bottom>
                        <select name="keyField" size="1">
                              <option value="title">제목
                              <option value="account_name">글쓴이
                              <option value="content">내용
                        </select> 
                        <input type="text" size="16" name="keyWord">
                        <input type="button" value="검색" onClick="check()">
                        <input type="hidden" name="page" value="0"></td>
                     </tr>
                  </table>
               </form>

               <table align=center width=80% border=0 cellspacing=0 cellpadding=3>
                  <tr>
                     <td align=center colspan=2>
                        <table border=1 width=100% cellpadding=2 cellspacing=0>
                           <tr align=center height=120%>
                              <td width=10% name=review_no>No</td>
                              <td width=60% name=title>제목</td>
                              <td width=10% name=account_name>글쓴이</td>
                              <td width=10% name=date>날짜</td>
                              <td width=10% name=grade>별점</td>
                              
                           </tr>
                           <%
                              if (list.size() == 0) {
                           %>
                           <tr>
                              <td>등록된 글이 없습니다.</td>
                           </tr>
                           <%
                              } else {
                                 for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
                                    if (i == totalRecord)
                                       break;

                                    ReviewDto dto = (ReviewDto) list.get(i);
                           %>
                           <tr align="center">
                              <td><%=dto.getReview_no()%></td>
                              <td><a href="review_Read.jsp?account_no=<%=accountdto.getAccount_no() %>&review_no=<%=dto.getReview_no()%>"><%=dto.getTitle()%></a></td>
                              <td><%=dto.getAccount_name()%></td>
                              <td><%=dto.getDate()%></td>
                              <td><%=dto.getGrade()%></td>
                           </tr>
                           <%
                              }
                           }
                           %>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td><BR> <BR></td>
                  </tr>
                  <tr>
                     <td align="left">Go to Page &nbsp;&nbsp;&nbsp;
<%
                      if (nowBlock > 0) {
%>
                     <a href="review_List.jsp?nowBlock=<%=nowBlock - 1%>&nowPage=<%=(nowBlock - 1) * pagePerBlock%>">이전 <%=pagePerBlock%>개
                     </a>:::&nbsp;&nbsp;&nbsp; 
<%
                      }
%>
<%
                      for (int i = 0; i < pagePerBlock; i++) {
                         if (i + (nowBlock * pagePerBlock) == totalPage)
                            break;
 %>
                         <a href="review_List.jsp?nowPage=<%=i + (nowBlock * pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i + 1 + (nowBlock * pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
<%
                     }
%>
<%
                      if (totalBlock > nowBlock + 1) {
 %> 
                         ::: <a href="review_List.jsp?nowBlock=<%=nowBlock + 1%>&nowPage=<%=(nowBlock + 1) * pagePerBlock%>">다음 <%=pagePerBlock%>개 </a> 
<%
                      }
 %>
                     </td>
                     <td align=right><a href="review_Post.jsp">[글쓰기]</a> <a
                        href="review_List.jsp">[처음으로]</a></td>
                  </tr>
               </table>
               <BR>
            </div>
         </div>
      </div>
      <!-- 공간주기 -->
      <div style="height: 50px;">&nbsp;</div>
      <footer>
         <%@ include file="../include/footer.jsp"%>
      </footer>
   </section>
   <script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
   <script src="../lib/bootstrap/js/bootstrap.js"></script>
 
</body>
</html>