<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderDto"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="order.OrderDao"/>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("ddHHmmss");
	String today = formatter.format(new java.util.Date());
	//int account_no = (Integer)session.getAttribute("account_no");
	int account_no = 5;

	String order_code = dao.Order_Code(account_no,today);
	session.setAttribute("order_code", order_code);
	
	 
%>


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
	.padding{
		padding-top:10px;
		padding-bottom:10px;
	}
</style>
</head>
<body class="page">
<section id="page" class="csstransition cmsms_resp hfeed site">
<%@ include file="../include/header.jsp"%>

	<div class="container">
		<div class="col-md-12">
			<div class="col-md-2">
				<ul>
					<li onclick="ListView('bread')"> 샌드위치</li>
					<li onclick="ListView('side')">사이드메뉴</li>
				</ul>
			</div>
			<form id="OrderSaveForm" class="form-horizontal" onsubmit="return false;">
				<input type="hidden" name="order_code" value="<%=order_code%>"/>
				<div class="col-md-10">
					<div class="col-md-12 padding">
						<input type="hidden" name="account_no" value="<%=account_no%>"/>
						<div class="col-md-3">
							<h3> 매장 선택</h3>
						</div>
						<div class="col-md-4">
							<select id="manage_addr" onchange="SelManagerAddr()">
									<option value="" width="200px;"> 선택해주세요</option>
								<%
								try {
									ArrayList manageList = dao.ManagerAddrList();
									for (int i = 0; i < manageList.size(); i++) {
										OrderDto dto = (OrderDto) manageList.get(i);
									%>
									<option value="<%=dto.getManage_addr()%>"><%=dto.getManage_addr()%></option>
								<%
								}
	
								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
								%>
							
							</select>
						</div>
						<div class="col-md-4" id="manage_name" >
						</div>
					</div>
					<div class="col-md-12" id="Sandwich">
						<div class="col-md-12 padding" id="breadSel">
							<div class="col-md-3">
								<h3>빵 선택</h3>
							</div>
							<div class="col-md-9">
								
									<%
									try {
										ArrayList BreadList = dao.BreadList();
										for (int i = 0; i < BreadList.size(); i++) {
											OrderDto dto = (OrderDto) BreadList.get(i);
										%>
										<div class="col-md-12 radio">
											<input type="radio" name="bread_no" value="<%=dto.getBread_no()%>"/>
											<p><b><%=dto.getBread_name() %> : </b> (<%=dto.getBread_detail()%>) </p>
										</div>
									<%
									}
		
									} catch (Exception err) {
										System.out.println("index.jsp : " + err);
									}
									%>
		
							</div>
						</div>
							<!-- 메뉴 선택 시작-->
						<div class="col-md-12" id="menuSel">
							<div class="col-md-12 padding">
								<div class="col-md-3">
									<h3>메뉴선택</h3>
								</div>
								<button id="Favorites" class="btn btn-primary">★ 즐겨찾기</button>
							</div>
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3">
									<h3>사이즈선택</h3>
								</div>
								<input type="radio"	name="menu_size" value="15" checked onclick="SelMenuClass()"/> 15cm &nbsp;&nbsp;&nbsp;
								<input type="radio" name="menu_size" value="30" onclick="SelMenuClass()"/> 30cm
							</div>
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3">
									<select id="menu_class" name="menu_class" onchange="SelMenuClass()">
									<option value="All" selected>전체보기</option>
										<%
										try {
											ArrayList menu_classList = dao.MenuClassList();
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
										
									</select>
								</div>
									<!-- 메뉴들 for문 돌릴 부분  -->
								<div class="col-md-9">
									<div class="col-md-12" id="Html_MenuList">
									
									</div>
									<!-- 메뉴들 for문 돌릴 부분 끝 -->
								</div>
							</div>
						</div>
							<!-- 메뉴 선택 끝-->
							<!--  채소 선택 시작 -->
						<div class="col-md-12" id="vegetableSel">
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3"><h3>채소선택</h3></div>
							</div>
							<!-- 채소  -->
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3">
									<button class="btn btn-primary" id="AllVegetable">All</button>
								</div>
								<!-- 채소들 for문 돌릴 부분  -->
								<div class="col-md-9">
									<div class="col-md-12 padding">
										<% 
										try {
											ArrayList vegetableList = dao.VegetableList();
											for (int i = 0; i < vegetableList.size(); i++) {
												OrderDto dto = (OrderDto) vegetableList.get(i);
										%>	
										<div class="col-md-4 vegetables" style=" height:200px;">
											<div style="text-align: center">
												<input type="checkbox" id="vegetable_no_<%=dto.getVegetable_no()%>" 
												name="vegetable_no[]" value="<%=dto.getVegetable_no()%>" />
											</div>
											<div class="cmsms_our_team">
												<div class="wrap_person">
													<img src="<%=dto.getVegetable_img()%>" class="fullwidth" alt="female-practitioner-s-1">
												</div>
											</div>
										</div>
									
										<%
											}
			
											}catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
										<input type="hidden" id="VegetableList" name="VegetableList"/>
									</div>
								</div>
									<!-- 메뉴들 for문 돌릴 부분 끝 -->
							</div>
						</div>
							<!--  채소 선택 끝 -->
							<!-- 공간 -->
						<div style="height: 50px; padding-top:20px; padding-bottom:20px;">&nbsp;</div>
							<!-- 공간 -->
							
							<!-- 소스 선택 -->
						<div class="col-md-12 padding" id="sauceSel">
							<div class="col-md-3">
								<h3>소스선택</h3>
							</div>
							<div class="col-md-9 ">
								<div class="col-md-12 padding" id="bestSauceHtml" style="display:none;"></div>
								<div class="col-md-12 padding" >
									<div class="col-md-4 padding " style="height:150px;">
									<label>달콤한소스</label>
										<%
											try {
												String sauce_class = "달콤한소스";
												ArrayList sauce = dao.SauceList(sauce_class);
												for (int i = 0; i < sauce.size(); i++) {
													OrderDto dto = (OrderDto) sauce.get(i);
										%>
										<div class="checkbox">
											<input type="checkbox" name="sauce_no[]" value="<%=dto.getSauce_no()%>" />
											<span style="padding-left: 10px;"> <%=dto.getSauce_name()%></span>
										</div>
										<%
												}
			
											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
										
									</div>
									<div class="col-md-4 padding" style="height:150px;">
										<label>매콤한소스</label>
										
										<%
											try {
												String sauce_class = "매콤한소스";
												ArrayList sauce = dao.SauceList(sauce_class);
												for (int i = 0; i < sauce.size(); i++) {
													OrderDto dto = (OrderDto) sauce.get(i);
										%>
											<div class="checkbox">
												<input type="checkbox" name="sauce_no[]"
													value="<%=dto.getSauce_no()%>" /> <span
													style="padding-left: 10px;"> <%=dto.getSauce_name()%>
												</span>
											</div>
										<%
											}
			
											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
										
									</div>
									<div class="col-md-4 padding" style="height:150px;">
										<label>고소한소스</label>
										
										<%
											try {
												String sauce_class = "고소한소스";
												ArrayList sauce = dao.SauceList(sauce_class);
												for (int i = 0; i < sauce.size(); i++) {
													OrderDto dto = (OrderDto) sauce.get(i);
										%>
										<div class="checkbox">
											<input type="checkbox" name="sauce_no[]"
												value="<%=dto.getSauce_no()%>" /> <span
												style="padding-left: 10px;"> <%=dto.getSauce_name()%>
											</span>
										</div>
										<%
											}
			
											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
									</div>
									<div class="col-md-4 padding" style="height:150px;">
										<label>새콤한소스</label>
										
										<%
											try {
												String sauce_class = "새콤한소스";
												ArrayList sauce = dao.SauceList(sauce_class);
												for (int i = 0; i < sauce.size(); i++) {
													OrderDto dto = (OrderDto) sauce.get(i);
										%>
											<div class="checkbox">
												<input type="checkbox" name="sauce_no[]"
													value="<%=dto.getSauce_no()%>" /> <span
													style="padding-left: 10px;"> <%=dto.getSauce_name()%>
												</span>
											</div>
										<%
											}
			
											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
									</div>
									<div class="col-md-4 padding" style="height:150px;">
										<label>일반소스</label>
										
										<%
											try {
												String sauce_class = "일반소스";
												ArrayList sauce = dao.SauceList(sauce_class);
												for (int i = 0; i < sauce.size(); i++) {
													OrderDto dto = (OrderDto) sauce.get(i);
										%>
											<div class="checkbox">
												<input type="checkbox" name="sauce_no[]" value="<%=dto.getSauce_no()%>"/> 
												<span style="padding-left: 10px;">
													 <%=dto.getSauce_name()%>
												</span>
											</div>
										<%
												}
			
											} catch (Exception err) {
												System.out.println("index.jsp : " + err);
											}
										%>
									</div>
	
									<input type="hidden" id="SelectSauceValue" name="SelectSauceValue"/>
								</div>
							</div>
						</div>
						<div class="col-md-12 padding">
							<div class="checkbox">
								<label class="btn btn-primary">&nbsp;&nbsp;
									<input type="checkbox" name="favorite" value="ok" style="padding-left:5px;"/>★ 즐겨찾기 추가
								</label>
							</div>
						</div>
						<!-- 소스끝 -->
						<div class="col-md-12 padding">
							<aside class="box success_box">
								<table >
									<tbody>
										<tr>
											<td style="text-align:center; width:50%;"><h4>메뉴 이름</h4> </td>
											<td style="text-align:center; width:25%;"><h4>가격</h4></td>
											<td style="text-align:center; width:25%;"><h4>수량</h4></td>
										</tr>
										<tr>
											<td id="Html_menu_name" style="text-align:center;"></td>
											<td id="Html_basic_price" style="text-align:center;"></td>
											<td style="text-align:center;"><input type="text" class="form-control" placeholder="수량입력" id="Menu_count" name="count" onblur="Menu_CountPrice()"/></td>
										</tr>
										<tr>
											<td colspan="3" style="text-align:right;">
											<h4>합계 : <span id="Html_CountPrice" style="padding-left:20px; padding-right:20px;"></span></h4>
												<input type="hidden" id="CountPirce" name="CountPirce"/>
											</td>
										</tr>
									</tbody>
								</table>
							</aside>
						</div>
					</div>
					<div class="col-md-12 padding" id="side_menu" style="display:none;">
					<div class="col-md-3">
						<select id="sidemenu_category" name="sidemenu_category" onchange="SelSideMenuClass()">
						<option value="All" selected>전체보기</option>
						<%
							try {
								ArrayList Sidemenu_classList = dao.SideMenuClassList();
								for (int i = 0; i < Sidemenu_classList.size(); i++) {
									OrderDto dto = (OrderDto) Sidemenu_classList.get(i);
									
						%>
								<option value="<%=dto.getSide_category()%>"><%=dto.getSide_category()%></option>
						<%
									}
			
								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
						%>
							
						</select>
					</div>
					<div class="col-md-9">
						<div class="col-md-12" id="Html_SideMenuList">
						</div>
					</div>
					<div class="col-md-12 padding">
							<aside class="box success_box">
								<table class="table">
										<tr>
											<th style="text-align:center; width:15%"><h4>선택 취소</h4></th>
											<th style="text-align:center; width:30%"><h4>메뉴 이름</h4> </th>	
											<th style="text-align:center; width:15%"><h4>가격</h4></th>
											<th style="text-align:center; width:20%"><h4>수량</h4></th>
											<th style="text-align:center; width:20%"><h4>합계</h4></th>
										</tr>
										<tbody id="Html_SideAppend">
										</tbody>
										<tr>
											<td colspan="5" style="text-align:right;">
											<h4>총 합계 : <span id="HtmlSide_CountPrice" style="padding-left:20px; padding-right:20px;"></span></h4>
												<input type="hidden" id="SideCountPirce" name="SideCountPirce"/>
											</td>
										</tr>
							
								</table>
							</aside>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-6">
							<button class="btn btn-primary" id="Order_Save">주문하기</button>
						</div>
						<div class="col-md-6">
							<button class="btn btn-primary" id="DetailOrder_Save">다른메뉴 주문하기</button>
						</div>
					</div>	
				</div>
			</form>
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
						</tr>
						<%
				try {
					ArrayList OrderList = dao.MyOrderList(account_no,"favorite");
					for (int i = 0; i < OrderList.size(); i++) {
					OrderDto dto = (OrderDto) OrderList.get(i);
			%>
					<tr onclick="FavoriteCilck('<%=dto.getMenu_no()%>','<%=dto.getMenu_size()%>','<%=dto.getBread_no()%>','<%=dto.getVegetable_no_List()%>','<%=dto.getSauce_no_List()%>')">
						<td><%=dto.getMenu_name()%></td>
						<td>
						<span>빵 : <%=dto.getBread_name()%></span><br>
						<span>채소 :
						 <%
							ArrayList VegetableList = dao.VegetableOrderList(dto.getVegetable_no_List());
							for(int j=0; j<VegetableList.size(); j++){
								%>
									<%=VegetableList.get(j)%>
								<%
							}
						%>
						</span><br>
						<span>소스 :
						 <%
							ArrayList SauceList = dao.SauceOrderList(dto.getSauce_no_List());
							for(int j=0; j<SauceList.size(); j++){
								%>
									<%=SauceList.get(j)%>
								<%
							}
						%>
						
						</span>
						</td>
					</tr>
			<%
					}
					} catch (Exception err) {
						System.out.println("OrderModal.jsp : " + err);
					}
			%>
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
			$("#AllVegetable").click(function(){
				VegetableCheckAll();
			});
			//선택된 소스 보기
			$("#selectSauce").click(function(){
				selectSauRow();
			});
			$("input[name='menu_size']").click(function(){
				var size = $(":radio[name='menu_size']:checked").val();
			});
			$("#Order_Save").click(function(){
				SelectValues();
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
			sendRequest("POST", "menuSelectClass.jsp", MenuClassback, param);
			
	
		}
		// 메뉴 html 생성
		function MenuClassback(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var div = document.getElementById("Html_MenuList");
			 		div.innerHTML = httpRequest.responseText;
			 	}else{
					alert(httpRequest.status);
				}
			}
		}
		//사이드 메뉴 리스트
		function SelSideMenuClass(){
			var sidemenu_category = $("#sidemenu_category").val();
			var param = "category="+sidemenu_category;
			sendRequest("POST", "SidemenuView.jsp", SideMenuback, param);
		}
		function SideMenuback(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var div = document.getElementById("Html_SideMenuList");
			 		div.innerHTML = httpRequest.responseText;
			 	}else{
					alert(httpRequest.status);
				}
			}
		}
		
		
		// 매장 지점 
		function SelManagerAddr(){
			var manageraddr = $("#manage_addr").val();
			var param = "manager_addr=" + manageraddr;
			sendRequest("POST","managerSelect.jsp", Addrback ,param);
		}
		// 매장이름 나오게 할 부분
		function Addrback(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var div = document.getElementById("manage_name");
			 		div.innerHTML = httpRequest.responseText;
			 //		alert(httpRequest.responseText);
			 	}else{
					alert(httpRequest.status);
				}
			}
		}
		//메뉴 베스트 소스 알기
		function Menu_Bestsauce(){
			var menu_no = $(":radio[name='menu_no']:checked").val();
			var param = "menu_no=" + menu_no;
			sendRequest("POST","bestSauce.jsp", Sauceback ,param);
		}
		
		function Sauceback(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var div = document.getElementById("bestSauceHtml");
			 		div.innerHTML = httpRequest.responseText;
			 		div.style.display = "";
			 		ViewPrice();
			 		//	alert(httpRequest.responseText);
			 	}else{
					alert(httpRequest.status);
				}
			}	
		}
		
		function ViewPrice(){
			var menu_no = $(":radio[name='menu_no']:checked").val();
			var basic_price = $("#basic_price_"+menu_no).val();
			var menu_name = $("#menu_name_"+menu_no).val();	
			$("#Html_menu_name").text(menu_name);
			$("#Html_basic_price").text(basic_price);
			$("#Html_menu_name").val(menu_name);
			$("#Html_basic_price").val(basic_price);
			//alert(basic_price);
		}
		function Menu_CountPrice(){	
			var basic_price = $("#Html_basic_price").val();
			var menu_count = $("#Menu_count").val();
			var menuPrice = basic_price * menu_count;
			$("#CountPirce").val(menuPrice);
			$("#Html_CountPrice").html(menuPrice);
		}
		function SelectValues(){
			selectVegRow();
			selectSauRow();
			OrderSave_Check();
		}
		function OrderSave_Check(){
		
			var menu_no = $(":radio[name='menu_no']:checked").val();
			var bread_no = $(":radio[name='bread_no']:checked").val();
			var store_no = $("#store_no").val();
			if(store_no == ""){
				alert("매장을 선택해 주세요.");
				return;
			}
			if(bread_no == null){
				alert("빵종류를 선택해 주세요");
				return;
			}
			if(menu_no == null){
				alert("메뉴를 선택해 주세요.");
				return;
			}
		
			if($("#VegetableList").val()==""){
				alert("채소를 선택 해 주세요.");
				return;
			}
			if($("#SelectSauceValue").val()==""){
				alert("소스를 선택 해 주세요.");
				return;
			}
			
			OrderSave();
		}
		
		function OrderSave(){
			 var param = $("#OrderSaveForm").serialize();
			sendRequest("POST","OrderSave.jsp", DetailOrderSaveBack,param);
			
		}
		function DetailOrderSaveBack(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					alert("저장 성공!");
					location.href="OrderList.jsp";
			 		//	alert(httpRequest.responseText);
			 	}else{
					alert(httpRequest.status);
				}
			}	
	
		}
		//즐겨찾기 내용 늘렀을때
		function FavoriteCilck(menu, size, bread, vegetable, sauce){
			//alert("menu = " +menu+ "size= " + size+ "bread =" + bread + "vegetable =" + vegetable + "sauce = " +sauce  );
			$("input:radio[name='menu_size']:radio[value='"+size+"']").prop("checked",true);
			$("input:radio[name='bread_no']:radio[value='"+bread+"']").prop("checked",true);
			//채소리스트 넘어온것에 split 하여 돌려서 value 맞는거에 체크하게 하기
			var vegetableList = vegetable.split('|');
			for( var i in vegetableList ){
				$("input:checkbox[name='vegetable_no[]']:checkbox[value='"+vegetableList[i]+"']").prop("checked",true);		
			}
			//소스리스트 넘어온것에 split 하여 for문으로 돌려서 value 맞는거에 체크하게 하기
			var sauceList = sauce.split('|');
			for(var i in sauceList){
				$("input:checkbox[name='sauce_no[]']:checkbox[value='"+sauceList[i]+"']").prop("checked",true);
			}
		
			$("input:radio[name='menu_no']:radio[value='"+menu+"']").prop("checked",true) ;
			
			$("#FavoriteList").modal('hide');
			  ViewPrice();
		}
		
	
		// 사이드 메뉴 선택인가 샌드위치 선택인가
		function ListView(list){
			if(list =="side"){
				$("#Sandwich").css("display","none");
				$("#side_menu").css("display","");
				SelSideMenuClass();
			}else{
				$("#Sandwich").css("display","");
				$("#side_menu").css("display","none");
			}
		}
		// check박스의 checked 되어있으면 테이블 행 추가 아닐시 삭제 
		function SelCheckbox(side_no){
			var checked = $("input:checkbox[id='side_menu_no_"+side_no+"']").is(":checked");
			if(checked == true){
				$("#Html_SideAppend").append('<tr id="Html_TrAppeand_'+side_no+'"><td><button class="btn btn-danger" onclick="SideMenuDel('+side_no+')">선택취소</button></td><td id="Html_side_menu_name_'+side_no+'" style="text-align:center;"></td><td id="Html_side_basic_price_'+side_no+'" style="text-align:center;"></td><td style="text-lign:center;"><input type="text" class="form-control" placeholder="수량을 입력해주세요" id="SideMenu_count_'+side_no+'" name="count" onblur="SideMenu_CountPrice('+side_no+')"/></td><td id="SideCountPirce_'+side_no+'"></td></tr>');			
			}else{
				SideMenuDel(side_no);
			}
			
			HtmlSelectSide(side_no);
			
		}
		// append로 테이블행 생성 될때마다 사이드 메뉴의 이름과 가격들을 불러온다.
		function HtmlSelectSide(side_no){
			var sidemenu_name = $("#sidemenu_name_"+side_no).val();
			var sidebasic_price = $("#sidebasic_price_"+side_no).val();
			$("#Html_side_menu_name_"+side_no).html(sidemenu_name);
			$("#Html_side_basic_price_"+side_no).html(sidebasic_price);
			$("#Html_side_menu_name_"+side_no).val(sidemenu_name);
			$("#Html_side_basic_price_"+side_no).val(sidebasic_price);
		}
		// 사이드 메뉴의 수량들을 입력하면, 가격 계산 
		function SideMenu_CountPrice(side_no){
			var sidebasicprice = $("#Html_side_basic_price_"+side_no).val();
			var sidecount = $("#SideMenu_count_"+side_no).val();
			
			var sidecountPrice = sidebasicprice * sidecount;
			
			$("#SideCountPirce_"+side_no).html(sidecountPrice);
			$("#SideCountPirce_"+side_no).val(sidecountPrice);
			TotalSidePrice(null,side_no);
		}
		var TotalPrice = 0;
		// 가격들을 Total 적으로 총합계를 낸다.
		function TotalSidePrice(price,side_no){
			var SideCountPrices =  $("#SideCountPirce_"+side_no).val();
		//	alert(SideCountPrices);
			if(price == null){
				TotalPrice += parseInt(SideCountPrices);
			}else{
				TotalPrice -= parseInt(price);	
			}
			alert(TotalPrice);
			
			$("#SideCountPirce").val(TotalPrice);
			$("#HtmlSide_CountPrice").html(TotalPrice);
		}
		// 사이드 메뉴 선택 취소 누를시 가격, 테이블행 삭제, 체크 풀기
		function SideMenuDel(side_no){
			var price = $("#SideCountPirce_"+side_no).val();
			$("input:checkbox[id='side_menu_no_"+side_no+"']").prop("checked",false);
			TotalSidePrice(price,side_no);
			$("#Html_TrAppeand_"+side_no).remove();
			
			
		}
		
	</script>

</body>
</html>