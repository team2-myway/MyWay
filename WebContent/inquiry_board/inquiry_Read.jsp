<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<jsp:useBean id="dao" class="inquiry.InquiryDao" />
<jsp:useBean id="dto" class="inquiry.InquiryDto" />
<!DOCTYPE html>
<html>
<head>
<style>
	.color{
		background-color:#E4F7BA;
	}

</style>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css"
	type="text/css" charset="utf-8" />
<script
	src="../lib/daumeditor/js/editor_loader.js?environment=development"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	AccountDto adto = new AccountDto();
	AccountDao adao = new AccountDao();
	adto = adao.session(session.getAttribute("id"));
	String session_level = adto.getLevel();
	int account_no = Integer.parseInt(request.getParameter("account_no"));
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	
	
	
%>
<script>
	function fnReplyCheck(board_no) {
		var session_id = "<%=session_level%>";
		if (session_id == null) {
			alert("관리자만 답변할 수 있습니다");
		} else if(session_id == "super") {
			location.href="inquiry_Reply.jsp?board_no="+board_no;
		} else {
			alert("관리자만 답변할 수 있습니다");
		}
	}
</script>

</head>
<body class="page">
<%
	request.setCharacterEncoding("UTF-8");
	dto = dao.getInquiryRead(board_no);

%>
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<h3>문의 사항</h3>
				<div class="col-md-12">
					<button class="btn btn-success" onclick="ListBack()">리스트 보기</button>
				</div>
				<div class="col-md-12" style="padding-top:20px;">
					<table class="table" width=100% cellpadding=4 cellspacing=0 border="1">
							<tr>
								<td class="color" style="width:100px; text-align:center;">제 목</td>
								<td colspan="3"><%=dto.getTitle() %></td>
							</tr>
							<tr>
								<td class="color" style="text-align:center;">작성자</td>
								<td style="width:450px;"><b><%=dto.getAccount_name()%></b></td>
								<td class="color" style="width:100px; text-align:center;">카테고리</td>
								<td><%=dto.getCategory() %></td>
							</tr>
							<tr>
								<td class="color" style="text-align:center;">내용</td>
								<td colspan="4"><%=dto.getContent() %> </td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
															<%
								 if(session_id == null){
								 }else if(session.getAttribute("level").equals("super") || account_no == adto.getAccount_no()){
									 %>
									<input type="button" class="btn btn-warning" id="modify" value="수정" onclick="location.href='inquiry_UpdateChk.jsp?account_no=<%=account_no%>&board_no=<%=dto.getBoard_no()%>'"/>
									<input type="button" class="btn btn-danger" id="delete" value="삭제" onclick="location.href='inquiry_Delete.jsp?account_no=<%=account_no%>&board_no=<%=dto.getBoard_no()%>'"/>
												
									<% 

								 }
									if(session_level.equals("super")){
								%>
									<input type="button" class="btn btn-info" id="reply" value="답변" onclick="fnReplyCheck('<%=dto.getBoard_no()%>')"/></td>
								<%
									}
								%>
							</tr>
						</table>
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
	<script>
	function ListBack(){
		location.href="inquiry_List.jsp";
	}
	</script>
</body>
</html>