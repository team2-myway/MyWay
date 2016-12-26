<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<jsp:useBean id="dao" class="inquiry.InquiryDao" />
<jsp:useBean id="dto" class="inquiry.InquiryDto" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css"
	type="text/css" charset="utf-8" />
<script
	src="../lib/daumeditor/js/editor_loader.js?environment=development"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function fnReplyCheck(board_no) {
		alert("session");
		var session_id = <%=session.getAttribute("id") %>;
		alert("session_id : " +session_id);
		if(session_id == null) {
			alert("관리자만 답글을 작성할 수 있습니다.");	
			history.back();
		} else if(session_id != null) {
			location.href="inquiry_Reply.jsp?board_no="+board_no;
		}
	}
</script>

</head>
<body class="page">
<%
	request.setCharacterEncoding("UTF-8");
	int account_no = Integer.parseInt(request.getParameter("account_no"));
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	dto = dao.getInquiryRead(board_no);
%>
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<div class="col-md-12">
					<form method="post" accept-charset="utf-8">
						<table width=80% align=left cellpadding=4 cellspacing=0 boarder="1">
							<tr>
								<td align=left>제 목</td>
								<td size=40><%=dto.getTitle() %></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td><%=dto.getCategory() %></td>
							</tr>
							
							<tr>
								<td>내용</td>
								<td><%=dto.getContent() %> </td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" id="modify" value="수정" onclick="location.href='inquiry_UpdateChk.jsp?account_no=<%=account_no%>&board_no=<%=dto.getBoard_no()%>'"/>
									<input type="button" id="delete" value="삭제" onclick="location.href='inquiry_Delete.jsp?account_no=<%=account_no%>&board_no=<%=dto.getBoard_no()%>'"/>
									<input type="button" id="reply" value="답변" onclick="fnReplyCheck('<%=dto.getBoard_no()%>')"/></td>
							</tr>
						</table>
					</form>
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