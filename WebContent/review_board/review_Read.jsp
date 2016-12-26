<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css" type="text/css" charset="utf-8" />
<script src="../lib/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<title>후기글</title>
<jsp:useBean id="dao" class="review.ReviewDao" />
<jsp:useBean id="dto" class="review.ReviewDto" />
<%
	request.setCharacterEncoding("UTF-8");
    String review_no = request.getParameter("review_no");
    int account_no = Integer.parseInt(request.getParameter("account_no"));
    
    dto = dao.getReviewRead(review_no);
    List list = dao.getCommentRead(review_no);  
%>
<script>
	function fnUpdateCheck(account_no, review_no) {
		var session_id = <%=session.getAttribute("id")%>;
		if(session_id == null) {
			alert("회원만 수정할 수 있습니다");
		} else {			
			location.href="review_Update.jsp?&account_no="+account_no+"&review_no="+review_no;
		}
	}

	function fnSessionCheck() {
		var session_id = <%=session.getAttribute("id")%>;
		if (session_id == null) {
			alert("회원만 작성할 수 있습니다.");
			history.back();
		}
	}
</script>
</head>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<div class="col-md-12">
					<form method="post" accept-charset="UTF-8">
						<table width=80% border=0 cellspacing=0 cellpadding=3 align="center">
							<tr>
								<td>제 목</td>
								<td size=40><%=dto.getTitle() %></td>
								<td>이름</td>
								<td><%=dto.getAccount_name() %></td>
							</tr>
							<tr>
								<td>지 점</td>
								<td><%=dto.getManager_name() %></td>
								<td>날 짜</td>
								<td><%=dto.getDate() %></td>
								<td>별 점</td>
								<td><%=dto.getGrade() %></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><%=dto.getContent() %></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<input type="button" id="modify" value="목록"
									onclick="location.href='review_List.jsp'" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" id="modify" value="수정"
									onclick="fnUpdateCheck(<%=account_no%>, <%=dto.getReview_no()%>)" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" id="delete" value="삭제"
									onclick="location.href='review_Delete.jsp?account_no=<%=account_no%>&review_no=<%=dto.getReview_no()%>'" /></td>
							</tr>
						</table>
					</form>
					<br><br><br><br><br><hr/><br><br>
				</div>
				
				<div>
					<table width=80% border=0 cellspacing=0 cellpadding=3 align="center">
					<%
		if(list.isEmpty()) {
%>
			<tr align="center">
				<td>등록된 댓글이 없습니다!</td>
			</tr>
<%
		} else {

			for(int i=0; i<list.size(); i++) {
				ReviewDto commentdto = (ReviewDto)list.get(i);
%>
				<tr align="center">
					<td>이름</td><td><%=commentdto.getAccount_name()%></td>
					<td>날짜</td><td><%=commentdto.getDate() %></td>
					<td><br><br></td>
				</tr>
				<tr align="center">
					<td>내용</td>
					<td><%=commentdto.getContent() %></td>
					</tr>
<%
			}
		}
%>
					<tr>
						<td><BR> <BR></td>
					</tr>
						</table>
						<hr/>
					<form action="review_CommentProc.jsp" >
						<table width=80% border=0 cellspacing=0 cellpadding=3 align="center">
							<input type="hidden" name="review_no" value=<%=review_no %> />
							<tr>
								<td>댓글</td>
								<td><textarea name="content"></textarea></td>
							</tr>
							<tr>
								<td><input type="submit" id="commentsave" value="댓글등록" onclick="fnSessionCheck()"/></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		
		
		<!-- 공간주기 -->
		<div style="height: 50px;">&nbsp;</div>
		<footer>
			<%@ include file="../include/footer.jsp" %>
		</footer>
	</section>
	<script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>