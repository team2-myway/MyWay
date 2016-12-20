<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="Menu.dao.MenuDao"></jsp:useBean>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
			  	<p>
			<b style="color: green"> Myway 메뉴 등록</b>
		</p>
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<td class="heading" valign="top" align="right" nowrap>메뉴 이름</td>
				<td valign="top" align=left><input type="text" name="name"
					size="80" /></td>
			</tr>
			<tr>
				<td>메뉴 카테고리</td>
				<td>
					<select name="class">
						<option value="프리미엄">프리미엄</option>a
						<option value="베스트">베스트</option>
						<option value="클래식">클래식</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>사이즈</td>
				<td valign="top" align=left>
					<input type="radio" name="menu_size" value="15" checked/> 15cm&nbsp;&nbsp;&nbsp;
					<input type="radio" name="menu_size" value="30"/> 30cm&nbsp;&nbsp;&nbsp;
				 </td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>이미지 파일</td>
				<td valign="top" align=left>
					<input type="file" name="image" />
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>칼로리</td>
				<td valign="top" align=left>
					<input type="text" name="calorie"/>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>가격</td>
				<td valign="top" align=left>
					<input type="text" name="price"/>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>추천소스</td>
				<td valign="top" align=left>
					<div class="col-md-12">
						<%
							try {
								String sauce=""
								ArrayList menu_classList = dao.SauceList(sauce);
								for (int i = 0; i < menu_classList.size(); i++) {
									OrderDto dto = (OrderDto) menu_classList.get(i);
									String menu_class= "";
									String selected = "";
									if(dto.getMenu_class().equals("best")){
										menu_class = "베스트";
									}else if(dto.getMenu_class().equals("classic")){
										menu_class = "클래식";
									}else{
										menu_class = "프리미엄";
									}
							%>
								<option value="<%=dto.getMenu_class()%>"><%=menu_class%></option>
							<%
							}

							} catch (Exception err) {
								System.out.println("index.jsp : " + err);
							}
							%>			
					</div>	
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="추가" />&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소" /></td>
			</tr>

		</table>
			  	
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