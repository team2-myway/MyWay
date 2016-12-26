<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>수정</title>
<jsp:useBean id="dao" class="review.ReviewDao" />
<jsp:useBean id="dto" class="review.ReviewDto" />
<script>
	function fnUpdateCheck() {
		if (document.form.pw.value == "") {
			alert("패스워드를 입력하세요.");
			form.pw.focus();
			return false;
		} 
			document.form.submit();
	}
</script>
</head>
</head>
<body class="page">
<%
	String review_no = request.getParameter("review_no");
	String account_no = request.getParameter("account_no");
	String pw = request.getParameter("pw"); 
	
	if(pw != null){
		boolean updateRs = dao.reviewUpdateChk(account_no, pw);
		if(updateRs == false) {
%>
			<script>
				alert("비밀번호 불일치");
				location.href="review_Read.jsp?account_no=<%=account_no%>&review_no=<%=review_no%>";
			</script>
<%
		} else if(updateRs == true) {
			%>
			<script>
				location.href="review_Update.jsp?account_no=<%=account_no%>&review_no=<%=review_no%>";
			</script>
			<%
		}
	
	} 
%>
<body class="page">
   <section id="page" class="csstransition cmsms_resp hfeed site">
      <%@ include file="../include/header.jsp"%>
      <div class="container">
         <div class="col-md-12">
            <div class="col-md-12">
               	<form name=form method="post" action="review_UpdateChk.jsp?account_no=<%=account_no %>&review_no=<%=review_no %>" accept-charset="UTF-8">
						<table width=80% border=0 cellspacing=0 cellpadding=3 align="center">
							<tr>
								<td>비밀번호를 입력해 주세요.</td>
								<td><input type="password" name="pw" /></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<input type="button" id="modify" value="수정"
									onclick="fnUpdateCheck()" /></td>
							</tr>
						</table>
					</form>
					<br><br>
				</div>
				
      <!-- 공간주기 -->
      <div style="height: 50px;">&nbsp;</div>
      <footer>
         <%@ include file="../include/footer.jsp"%>
      </footer>
   </section>
</body>
</html>