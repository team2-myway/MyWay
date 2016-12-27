<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script>
	function popupOpen(form) {
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;

		window.open("window_found_PW.jsp?id="+id+"&name="+name+"&email="+email,"foundPW","width=500 height=500 left=1000 top=100 directories=no location=no");			
		
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
            	
            	<div class="col-md-offset-3 col-md-6" style="text-align:center;">
	            	<h2 align="center">비밀번호 찾기</h2>
	            	<div class="form-group" >
	            		<form name="form">
							<table>
								<tr>
									<td>ID</td>
									<td><input type="text" id="id" name="id"/></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" id="name" name="name"/></td>
								</tr>
								<tr>
									<td>Email</td>
									<td><input type="text" id="email" name="email"/></td>
								</tr>
								<tr>
									<td><input type="button" value="찾기" class="btn btn-default" onclick="popupOpen(form)"/></td>
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