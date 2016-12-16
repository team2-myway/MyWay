<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.sauce{
		padding-top:5px;
		padding-left:5px;
		padding-right:5px;
		padding-bottom:5px;
	}
</style>
</head>
<body class="page">
<section id="page" class="csstransition cmsms_resp hfeed site">
	<%@ include file="../include/header.jsp"%>
	<jsp:useBean id="dao" class="order.OrderDao"/>
	<div class="container">
		<div class="col-md-12">
			<div class="col-md-2">
				<ul>
					<li>샌드위치</li>
					<li>샐러드</li>
					<li>사이드메뉴</li>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="col-md-12">
					<label class="col-md-3">매장 선택</label>
					<div class="col-md-3">
						<select id="manage_addr">
							<option>서울</option>
							<option>경기</option>
							<option>부산</option>
						</select>
					</div>
					<div class="col-md-3">
						<select id="manage_name">
							<option>화정점</option>
							<option>부산점</option>
							<option>선릉점</option>
						</select>
					</div>
				</div>
					<!-- 메뉴 선택 시작-->
				<div class="col-md-12" style="padding-top: 20px;">
					<label class="col-md-2">메뉴선택</label>
					<button id="Favorites" class="btn btn-primary">★ 즐겨찾기</button>
				</div>
				<div class="col-md-12" style="padding-top: 20px;">
					<label class="col-md-2">사이즈선택</label> 
					<input type="radio"	name="menu_size" value="15" checked/> 15cm &nbsp;&nbsp;&nbsp;
					<input type="radio" name="menu_size" value="30" /> 30cm
				</div>
				<div class="col-md-12" style="padding-top: 20px;">
					<div class="col-md-3">
						<select id="menu_class" name="menu_class" onchange="SelMenuClass()">
							<%
							try {
								ArrayList menu_classList = dao.MenuClassList();
								for (int i = 0; i < menu_classList.size(); i++) {
									OrderDto dto = (OrderDto) menu_classList.get(i);
									String menu_class= "";
									String selected = "";
									if(dto.getMenu_class().equals("best")){
										menu_class = "베스트";
										selected = "";
									}else if(dto.getMenu_class().equals("classic")){
										menu_class = "클래식";
										selected = "selected";
									}else{
										menu_class = "프리미엄";
										selected = "";
									}
							%>
								<option value="<%=dto.getMenu_class()%>" <%=selected%>><%=menu_class%></option>
							<%
							}

							} catch (Exception err) {
								System.out.println("index.jsp : " + err);
							}
							%>
							
						</select>
					</div>
						<!-- 메뉴들 for문 돌릴 부분  -->
					<div class="col-md-9">
						<div class="col-md-12" id="Html_MenuList">
						
						</div>
						<!-- 메뉴들 for문 돌릴 부분 끝 -->
					</div>
					<!-- 메뉴 선택 끝-->
					<!--  채소 선택 시작 -->
					<div class="col-md-12" style="padding-top: 20px;">
						<label class="col-md-2">채소선택</label>
					</div>
					<div class="col-md-12" style="padding-top: 20px;">
						<div class="col-md-3">
							<button class="btn btn-primary" id="AllVegetable">All</button>
						</div>

						<!-- 채소들 for문 돌릴 부분  -->
						<div class="col-md-9">
							<div class="col-md-12">
								<% 
								try {
									ArrayList vegetableList = dao.VegetableList();
									for (int i = 0; i < vegetableList.size(); i++) {
										OrderDto dto = (OrderDto) vegetableList.get(i);
							%>	
								<div class="col-md-4 vegetables" style="border-color:aqua; border:solid;">
									<div style="text-align: center">
										<input type="checkbox" id="vegetable_no_<%=dto.getVegetable_no()%>" 
										name="vegetable_no[]" value="<%=dto.getVegetable_no()%>" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="<%=dto.getVegetable_img()%>" class="fullwidth" alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span><%=dto.getVegetable_name()%></span>
											<span><%=dto.getVegetable_no()%></span>
										</div>
									</div>
								</div>
							
							<%
								}

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
								%>
								<input type="text" id="VegetableList"/>
							</div>
						</div>
						<!-- 메뉴들 for문 돌릴 부분 끝 -->
					</div>
					
					<!--  채소 선택 끝 -->
					<!-- 공간 -->
					<!-- 공간 -->
					
					<!-- 소스 선택 -->
					<div id="sauce">
						<div class="col-md-2">
							소스선택
						</div>
						<div class="col-md-10">
							<div class="col-md-12">
							<label>달콤한소스</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "달콤한소스";
									ArrayList sauce = dao.SauceList(sauce_class);
									for (int i = 0; i < sauce.size(); i++) {
										OrderDto dto = (OrderDto) sauce.get(i);
							%>
								<input type="checkbox" name="sauce_no[]"
									value="<%=dto.getSauce_no()%>" /> <span
									style="padding-left: 10px;"> <%=dto.getSauce_name()%>
								</span>
							
							<%
								}

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
							%>
							</div>
						</div>
						<div class="col-md-12">
							<label>매콤한소스</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "매콤한소스";
									ArrayList sauce = dao.SauceList(sauce_class);
									for (int i = 0; i < sauce.size(); i++) {
										OrderDto dto = (OrderDto) sauce.get(i);
							%>
								<input type="checkbox" name="sauce_no[]"
									value="<%=dto.getSauce_no()%>" /> <span
									style="padding-left: 10px;"> <%=dto.getSauce_name()%>
								</span>
							<%
								}

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
							%>
							</div>
						</div>
						<div class="col-md-12">
							<label>고소한소스</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "고소한소스";
									ArrayList sauce = dao.SauceList(sauce_class);
									for (int i = 0; i < sauce.size(); i++) {
										OrderDto dto = (OrderDto) sauce.get(i);
							%>
								<input type="checkbox" name="sauce_no[]"
									value="<%=dto.getSauce_no()%>" /> <span
									style="padding-left: 10px;"> <%=dto.getSauce_name()%>
								</span>
							<%
								}

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
							%>
							</div>
						</div>
						<div class="col-md-12">
							<label>새콤한소스</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "새콤한소스";
									ArrayList sauce = dao.SauceList(sauce_class);
									for (int i = 0; i < sauce.size(); i++) {
										OrderDto dto = (OrderDto) sauce.get(i);
							%>
								<input type="checkbox" name="sauce_no[]"
									value="<%=dto.getSauce_no()%>" /> <span
									style="padding-left: 10px;"> <%=dto.getSauce_name()%>
								</span>
							<%
								}

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
							%>
							</div>
						</div>
						<div class="col-md-12">
							<label>일반소스</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "일반소스";
									ArrayList sauce = dao.SauceList(sauce_class);
									for (int i = 0; i < sauce.size(); i++) {
										OrderDto dto = (OrderDto) sauce.get(i);
							%>
								<input type="checkbox" name="sauce_no[]" value="<%=dto.getSauce_no()%>"/> 
								<span style="padding-left: 10px;">
									 <%=dto.getSauce_name()%>
								</span>
							<%
									}

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
							%>
							</div>
						</div>
						<input type="text" id="SelectSauceValue" name="SelectSauceValue"/>
						<button id="selectSauce">버튼</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class=" modal fade" id="FavoriteList" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>즐겨 찾기</h3>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>메뉴</th>
							<th>세부내용</th>
							<th>선택</th>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" data-dismiss="modal">닫기</button>
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
	<script src = "../lib/ajax.js"></script>
	<script>
	window.onload = function(){
		SelMenuClass();
	}
		$(function() {
			// 즐겨찾기 목록 
			$("#Favorites").click(function() {
				$("#FavoriteList").modal();
			});
			//야채 전체선택
			$("#AllVegetable").click(function() {
				VegetableCheckAll();
			});
			//선택된 소스 보기
			$("#selectSauce").click(function(){
				selectSauRow();
			});
			$("input[name='menu_size']").click(function(){
				var size = $(":radio[name='menu_size']:checked").val();
			});
			
			
		});
		
		var check = false;
		//채소 모두선택 or 선택해제
		function VegetableCheckAll(){
			var chk = document.getElementsByName("vegetable_no[]");
			if(check == false){
				check = true;
				for(var i=0; i<chk.length;i++){                                                                    
					chk[i].checked = true;     //모두 체크
				}
			}else{
				check = false;
				for(var i=0; i<chk.length;i++){                                                                    
					chk[i].checked = false;     //모두 해제
				}
			}
		}
		
		//선택된 채소의 값 부르기
		function selectVegRow() {
			var chk = document.getElementsByName("vegetable_no[]"); // 체크박스객체를 담는다
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
				checkCnt++;        //체크된 체크박스의 개수
				checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 

			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
						if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						}else{
							rowid += checkRow+"|";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
				$("#VegetableList").val(rowid);
			}
		}
		
		//소스 체크된것 확인 3개이상일경우 못넘어가게 
		//아닐경우에 소스 value 값을 SelectSauceValue에다가 넣기 |값으로 구분하기
		function selectSauRow() {
			var chk = document.getElementsByName("sauce_no[]");
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
				checkCnt++;        //체크된 체크박스의 개수
				checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 

			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
						if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						}else{
							rowid += checkRow+"|";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
			}
			alert(checkCnt);
			if(checkCnt > 3){
				alert("소스는 3가지 까지 선택 가능합니다.");
				$("#sauce").focus();
			}else{
				$("#SelectSauceValue").val(rowid);
			}
		}
		// 메뉴 class 선택시 나오는 것
		function SelMenuClass(){
			var menuclass = $("#menu_class").val();
			var size = $(":radio[name='menu_size']:checked").val();

			var param = "class="+menuclass+"&size="+size;
			sendRequest("POST", "menuSelectClass.jsp", Classback, param);
			
		}
		function Classback(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var div = document.getElementById("Html_MenuList");
			 		div.innerHTML = httpRequest.responseText;
			 		alert(httpRequest.responseText);
				}else{
					alert(httpRequest.status);
				}
			}
		}
		
		
	</script>

</body>
</html>