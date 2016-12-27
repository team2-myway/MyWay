<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Join</title>
<script>
	function fncCheck() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var accept = document.getElementById("accept").checked;
	
		if (id.length < 4) {
			alert("ID를 4글자 이상 입력해 주세요");
			document.joinform.id.focus();
		} else if (pw.length < 4) {
			alert("PW를 4글자 이상 입력해 주세요");
			document.joinform.pw.focus();
		} else if (document.joinform.account_name.value == "") {
			alert("이름을 입력해 주세요");
			document.joinform.account_name.focus();
		} else if (document.joinform.tel2.value == "" || document.joinform.tel3.value == "") {
			alert("핸드폰 번호를 정확히 입력해 주세요");
			document.joinform.tel1.focus();
		} else if (accept == false) {
			alert("약관 동의에 체크해 주세요");
		} else {
			document.joinform.submit();
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
            	<div class="col-md-offset-2 col-md-8" style="text-align:center;">
	            	<h2 align="center">회원가입</h2>
	            	<div class="form-group">	
		            	<form action="join_proc.jsp" name="joinform" method="post" onsubmit="fncCheck();return false">
							<table>
								<tr>
									<td width="200"><label>ID</label></td>
									<td width="200"><input type=text name="id" id="id" size=60 maxlength=20></td>
									<td width="200"><label>PW</label></td>
									<td width="200"><input type="password" id="pw" name="pw" size=60 maxlength=20 /></td>
								</tr>
								<tr>
									<td><label>이름</label></td>
									<td colspan="3"><input type="text" id="account_name" name="account_name" /></td>
								</tr>
								<tr>
									<td><label>매장지역</label></td>
									<td><input type="text" id="manager_area" name="manager_area" /></td>
								</tr>
								<tr>
									<td><label>매장명</label></td>
									<td><input type="text" id="manager_name" name="manager_name" /></td>
								</tr>
								<tr>
									<td><label>전화번호</label></td>
									<td>
									<select id="tel1" name="tel1">
											<option selected="selected">010</option>
											<option>011</option>
											<option>012</option>
											<option>013</option>
									</select>
									</td>
									<td> - <input type="text" id="tel2" name="tel2" size=60 maxlength=20></td> 
									<td> - <input type="text" id="tel3" name="tel3" size=60 maxlength=20></td>
								</tr>
								<tr>
									<td><label>E-MAIL</label></td>
									<td colspan="2"><input type="text" id="email1" name ="email1" size="60" /> </td>
									<td> @ <select id="email2" name="email2">
											<option>naver.com</option>
											<option>daum.net</option>
											<option>gmail.com</option>
											<option>bulabula.com</option>
											<option>holahola.com</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="4"><textarea rows="5" cols="40" readonly="readonly">개인정보 동의</textarea></td>
								</tr>
								<tr>
									<td colspan="4" align="center"><input type="checkbox" id="accept" name="accept">동의합니다</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="submit" class="btn btn-default" value="확인" />
									</td>
									<td colspan="2" align="center">
										 <input type="submit" class="btn btn-default" value="메인"
										onclick="javascript:location.href='../main/index.jsp';" />
									</td>
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