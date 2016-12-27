<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script>
	function fncCheck(){
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		
		if (id.length==0) {
			alert("ID를 입력해 주세요");
			document.loginform.id.focus();
		}else if(pw.length==0){
			alert("PW를 입력해 주세요");
			document.loginform.pw.focus();
		}else{
			document.loginform.submit();
			return true;
		}
	}
</script>
</head>
<body class="page">
   <jsp:useBean id="dao" class="review.ReviewDao" />
   <section id="page" class="csstransition cmsms_resp hfeed site">
      <%@ include file="../include/header.jsp"%>
      <div class="container">
         <div class="col-md-12">
            <div class="col-md-12">
            
            	<div class="col-md-offset-4 col-md-4" style="text-align:center;">
	            	<div class="form-group">
		            	<form action="login_proc.jsp" name="loginform" method="post" onsubmit="fncCheck();return false" >
							<table>
								<tr>
									<td><h2 align="right">Login</h2></td>
								</tr>
								<tr>
									<td><label>ID</label></td>
									<td><input type="text" name="id" id="id" />
									<td rowspan="2"><input type="submit" class="btn btn-default" value="로그인" />
								</tr>
								<tr>
									<td><label>PW</label></td>
									<td><input type="password" name="pw" id="pw" />
								</tr>
								<tr>
									<td><input type="button" id="found_ID" class="btn btn-default" value="ID/PW 찾기" onclick="location.href='found_ID.jsp'"/></td>
									<td><input type="button" id="join" class="btn btn-default" value="회원가입" onclick="location.href='join.jsp'"/></td>
								</tr>
							</table>
						</form>  
	            	</div>
            	</div>
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
