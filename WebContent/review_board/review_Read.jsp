<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style>
.color{
		background-color:#E4F7BA;
	}
textarea{
	min-height: 100px;
}
</style>
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
    
    AccountDto adto = new AccountDto();
	AccountDao adao = new AccountDao();
	adto = adao.session(session.getAttribute("id"));
	String session_level = adto.getLevel();
    
    dto = dao.getReviewRead(review_no);
    List list = dao.getCommentRead(review_no);  
%>
<script>
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
					<div class="col-md-offset-1 col-md-10">
						<table width=100% border=0 cellspacing=0 cellpadding=3 border="1" class="table">
							<tbody style="text-align:center;">
								<tr>
									<td class="color" width="10%">제 목</td>
									<td colspan="2"width="40%"><%=dto.getTitle() %></td>
									<td class="color" width="10%">이름</td>
									<td colspan="2" width="40%"><%=dto.getAccount_name() %></td>
								</tr>
								<tr>
									<td class="color">지 점</td>
									<td><%=dto.getManager_name() %></td>
									<td class="color"width="10%">날 짜</td>
									<td width="15%"><%=dto.getDate() %></td>
									<td class="color"width="10%">별 점</td>
									<td width="15%"><%=dto.getGrade() %></td>
								</tr>
								<tr>
									<td class="color">내용</td>
									<td colspan="5" height="150px"><%=dto.getContent() %></td>
								</tr>
								<tr>
									<td colspan="6" align="center">
										<input type="button" id="modify" class="btn btn-success" value="목록"
										onclick="location.href='review_List.jsp'" />&nbsp;&nbsp;&nbsp;&nbsp;
							<%
								 if(session_id == null){
								 }else if(session.getAttribute("level").equals("super") || account_no == adto.getAccount_no()){
									 %>
												<input type="button" id="modify" class="btn btn-primary" value="수정"
												onclick="location.href='review_UpdateChk.jsp?account_no=<%=account_no%>&review_no=<%=review_no%>'" />&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="button" id="delete" class="btn btn-danger" value="삭제"
												onclick="location.href='review_Delete.jsp?account_no=<%=account_no%>&review_no=<%=dto.getReview_no()%>'" /></td>
												<% 

								 }
								%>
									
								</tr>
							</tbody>
						</table>
					</div>
					<br><br><br><br><br><hr/><br><br>
				</div>
				
				<div class="col-md-12">
					<div class="col-md-offset-1 col-md-10">
					<table width=100% border=1 style="border-color:aqua;" cellspacing=0 cellpadding=3 align="center">
					<%
		if(list.isEmpty()) {
%>
			<tr align="center">
				<td colspan="2">등록된 댓글이 없습니다!</td>
			</tr>
<%
		} else {

			for(int i=0; i<list.size(); i++) {
				ReviewDto commentdto = (ReviewDto)list.get(i);
%>
				<tr>
					<td width="10%" align="center" style="background-color:#D4F4FA">
					<%=commentdto.getAccount_name()%><br><%=commentdto.getDate() %>
					</td>
					<td style="padding-left:10px;background-color:#B2EBF4 " ><%=commentdto.getContent() %></td>
				</tr>
		
				
<%
			}
		}
%>
					</table>
				</div>
			</div>
			<hr/>
				<form action="review_CommentProc.jsp" method="post" >
					<div class="col-md-offset-1 col-md-10" style="padding-top:20px;">
						<table width=100% style="height:100px;" border=1 cellspacing=0 cellpadding=3 >
							<tbody style="text-align:center;">
								<tr>
									<td width="15%">댓글
									<input type="hidden" name="review_no" value=<%=review_no %>/>
									<input type="hidden" name="account_no" value=<%=account_no%>/>
									<input type="hidden" name="account_name" value=<%=adto.getAccount_name()%>/>
									</td>
									<td width="70%" height="100px"><textarea name="content" style="width:100%; height:100px;" ></textarea></td>
									<td width="15%" style="padding-left:20px;"><input type="submit" id="commentsave" value="댓글등록" onclick="fnSessionCheck()"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
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