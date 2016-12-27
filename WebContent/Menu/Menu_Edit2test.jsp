<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="Menu.dao.MenuDao"></jsp:useBean>
<jsp:useBean id="mdto" class="Menu.dto.MenuDto"></jsp:useBean>
<%
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	mdto = dao.MenuDetailList(menu_no);
	String[] sauceListview = mdto.getM_recomsauce().split("\\|");
%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<marquee behavior="alternate" scrollAmount="10">
					<font color="#009900" size="3">Myway 메뉴 수정</font>
				</marquee>
				<br> <br>
				<form id="Menu_Saves" onsubmit="return false;" method="post"
					action="Menu_Edit_Proc.jsp?menu_no=<%=menu_no%>"
					enctype="multipart/form-data">
					
					<table width="1000" border="1" cellspacing="0" cellpadding="15">
						<tr>
							<td class="heading" valign="top" align="right" nowrap>메뉴 이름</td>
							<td valign="top" align=left><input type="text"
								id="menu_name" name="menu_name" value="<%=mdto.getM_name()%>"
								namesize="80" /></td>
						</tr>
						<tr>
							<td>메뉴 카테고리</td>
							<td><select name="class" id="menu_class">
									<option value="premium"
										<%if (mdto.getM_class().equals("premium")) {%>
										selected="selected" <%}%>>premium</option>
									<option value="best"
										<%if (mdto.getM_class().equals("best")) {%>
										selected="selected" <%}%>>best</option>
									<option value="classic"
										<%if (mdto.getM_class().equals("classic")) {%>
										selected="selected" <%}%>>classic</option>
							</select></td>
						</tr>
						<tr>
							<td class="heading" valign="top" align="right" nowrap>사이즈</td>
							<td valign="top" align=left><input type="radio"
								name="menu_size" value="15" checked /> 15cm&nbsp;&nbsp;&nbsp; <input
								type="radio" name="menu_size" value="30" />
								30cm&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td class="heading" valign="top" align="right" nowrap>이미지 파일</td>
							<td valign="top" align=left><input type="file" name="image" />
							</td>
						</tr>
						<tr>
							<td class="heading" valign="top" align="right" nowrap>칼로리</td>
							<td valign="top" align=left><input type="text"
								name="calorie" id="calorie" value="<%=mdto.getM_calorie()%>" />
							</td>
						</tr>
						<tr>
							<td class="heading" valign="top" align="right" nowrap>가격</td>
							<td valign="top" align=left><input type="text" name="price"
								id="price" value="<%=mdto.getM_price()%>" /></td>
						</tr>
						<tr>
							<td class="heading" valign="top" align="right" nowrap>상세내용</td>
							<td valign="top" align=left><textarea name="detail"><%=mdto.getM_detail()%></textarea>
							</td>
						</tr>
						<br><br>
						
						<tr>
							<td class="heading" valign="top" align="right" nowrap>추천소스</td>
							<td valign="top" align=left>
								<div class="col-md-12">
									
										<label> 달콤한 소스</label>
										
										<%
											try {
												String sauce = "달콤한소스";
												ArrayList sauceList = dao.SauceList(sauce);
												for (int i = 0; i < sauceList.size(); i++) {
													OrderDto dto = (OrderDto) sauceList.get(i);
										%>
										</div>
										<div class="checkbox">
											<input type="checkbox" name="sauce_no[]"
												value="<%=dto.getSauce_no()%>"
												<%System.out.print(sauceListview[i] + "slv");
					System.out.println();
					System.out.print(dto.getSauce_no() + "gsn");

					for (int j = 0; j < sauceListview.length; j++) {
						if (sauceListview[i].equals(dto.getSauce_no())) {%>
												checked="checked" <%}
					}%> /> <span
												style="padding-left: 10px;"><%=dto.getSauce_name()%></span>
										
										<%
											}

											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
										
										</div>
								<td valign="top" align=right>
								<label> 매콤한 소스</label>
									<%
										try {
											String sauce = "매콤한소스";
											ArrayList sauceList = dao.SauceList(sauce);
											for (int i = 0; i < sauceList.size(); i++) {
												OrderDto dto = (OrderDto) sauceList.get(i);
									%>
								</div>
								<div class="checkbox">
									<input type="checkbox" name="sauce_no[]" value="" /> <span
										style="padding-left: 10px;"><%=dto.getSauce_name()%></span>
								</div>
								<div>
									<%
										}

										} catch (Exception err) {
											System.out.println("index.jsp : " + err);
										}
									%>
								</div><td>
								<div class="col-sm-4" style="height: 150px;">
									<label> 새콤한 소스</label>
									<%
										try {
											String sauce = "새콤한소스";
											ArrayList sauceList = dao.SauceList(sauce);
											for (int i = 0; i < sauceList.size(); i++) {
												OrderDto dto = (OrderDto) sauceList.get(i);
									%>
									<div class="checkbox">
										<input type="checkbox" name="sauce_no[]"
											value="<%=dto.getSauce_no()%>" /> <span
											style="padding-left: 10px;"><%=dto.getSauce_name()%></span>
									
									<%
										}

										} catch (Exception err) {
											System.out.println("index.jsp : " + err);
										}
									%>
								</div>
								<div class="col-sm-4" style="height: 150px;">
									<label> 고소한 소스</label>
									<%
										try {
											String sauce = "고소한소스";
											ArrayList sauceList = dao.SauceList(sauce);
											for (int i = 0; i < sauceList.size(); i++) {
												OrderDto dto = (OrderDto) sauceList.get(i);
									%>
									<div class="checkbox">
										<input type="checkbox" name="sauce_no[]"
											value="<%=dto.getSauce_no()%>" /> <span
											style="padding-left: 10px;"><%=dto.getSauce_name()%></span>
									</div>
									<%
										}

										} catch (Exception err) {
											System.out.println("index.jsp : " + err);
										}
									%>
								</div>
								<div class="col-sm-4" style="height: 150px;">
									<label> 일반 소스</label>
									<%
										try {
											String sauce = "일반소스";
											ArrayList sauceList = dao.SauceList(sauce);
											for (int i = 0; i < sauceList.size(); i++) {
												OrderDto dto = (OrderDto) sauceList.get(i);
									%>
									<div class="checkbox">
										<input type="checkbox" name="sauce_no[]"
											value="<%=dto.getSauce_no()%>" /> <span
											style="padding-left: 10px;"><%=dto.getSauce_name()%></span>

										<%
											}

											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
									</div>
									
							
						<br><br>
						<tr>
								</div> <input type="hidden" id="SelectSauceValue"
								name="SelectSauceValue" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button class="btn btn-primary" id="Menu_Save">저장</button> <input
								type="reset" value="취소" />
							</td>
						</tr>
					</table>
				</form>
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
		$(function() {
			$("#Menu_Save").click(function() {
				SelSauce();
			});
		});
		function SelSauce() {
			var chk = document.getElementsByName("sauce_no[]");
			var len = chk.length; //체크박스의 전체 개수
			var checkRow = ''; //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0; //체크된 체크박스의 개수
			var checkLast = ''; //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = ''; //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;
			for (var i = 0; i < len; i++) {
				if (chk[i].checked == true) {
					checkCnt++; //체크된 체크박스의 개수
					checkLast = i; //체크된 체크박스의 인덱스
				}
			}

			for (var i = 0; i < len; i++) {
				if (chk[i].checked == true) { //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if (checkCnt == 1) { //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow; //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					} else { //체크된 체크박스의 개수가 여러 개 일때,
						if (i == checkLast) { //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow; //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						} else {
							rowid += checkRow + "|"; //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = ''; //checkRow초기화.
				}
			}
			$("#SelectSauceValue").val(rowid);
			CheckValue();
		}
		function CheckValue() {
			var menu_name = $("#menu_name").val();
			var menu_class = $("#menu_class").val();
			var calorie = $("#calorie").val();
			var price = $("#price").val();
			var recomsrc = $("#SelectSauceValue").val();

			if (menu_name == "") {
				alert("메뉴이름을 써주세요");
				return;
			}
			if (menu_class == "") {
				alert("메뉴카테고리를  골라주세요");
				return;
			}
			if (calorie == "") {
				alert("칼로리를 입력해주세요.");
				return;
			}
			if (price == "") {
				alert("메뉴가격을 입력해주세요");
				return;
			}
			if (recomsrc == "") {
				alert("소스를 선택해주세요");
				return;
			}
			MenuSave();

		}
		function MenuSave() {
			document.getElementById("Menu_Saves").submit();
		}
	</script>

</body>
</html>