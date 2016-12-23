<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
<center><br>
<h2>게 시 판</h2>

<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  Articles(
		<font color=red>  1 / 10 Pages </font>)
	</td>
</tr>
</table>

<form action="review_List.jsp" name="search" method="post">
	<table width=80% align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=left>
			<a href="review_Post.jsp">[글쓰기]</a>
		</td>
		
		<td align=right valign=bottom>
			<select name="keyField" size="1">
				<option value="name"> 제목
				<option value="subject"> 글쓴이
				<option value="content"> 내용
			</select>

			<input type="text" size="16" name="keyWord" >
			<input type="button" value="검색" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=1 width=100% cellpadding=2 cellspacing=0>
			<tr align=center height=120%>
				<td width=10%> No </td>
				<td width=10%> 카테고리 </td>
				<td width=60%> 제목 </td>
				<td width=10%> 글쓴이 </td>
				<td width=10%> 날짜 </td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td align="left">Go to Page </td>
	<td align=right>
		<a href="javascript:list()">[처음으로]</a>
	</td>
</tr>
</table>
<BR>

</center>	


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