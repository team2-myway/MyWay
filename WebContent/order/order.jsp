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
					<li onclick="ListView('bread')"> ������ġ</li>
					<li onclick="ListView('side')">���̵�޴�</li>
				</ul>
			</div>
			<form id="OrderSaveForm" class="form-horizontal" onsubmit="return false;">
				<input type="hidden" name="order_code" value="<%=order_code%>"/>
				<div class="col-md-10">
					<div class="col-md-12 padding">
						<input type="hidden" name="account_no" value="<%=account_no%>"/>
						<%
								try {
									ArrayList Account = dao.MyAccountList(account_no);
									for (int i = 0; i < Account.size(); i++) {
										OrderDto dto = (OrderDto) Account.get(i);
									%>
									<input type="hidden" name="account_name" value="<%=dto.getAccount_name()%>"/>
									<input type="hidden" name="tel" value="<%=dto.getAccount_tel()%>"/>
								<%
								}
	
								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
								%>
						<input type="hidden" id="OrderTypes" name="OrderTypes" value="bread"/>
						<div class="col-md-3">
							<h3> ���� ����</h3>
						</div>
						<div class="col-md-4">
							<select id="manage_addr" onchange="SelManagerAddr()">
									<option value="" width="200px;"> �������ּ���</option>
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
								<h3>�� ����</h3>
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
							<!-- �޴� ���� ����-->
						<div class="col-md-12" id="menuSel">
							<div class="col-md-12 padding">
								<div class="col-md-3">
									<h3>�޴�����</h3>
								</div>
								<button id="Favorites" class="btn btn-primary">�� ���ã��</button>
							</div>
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3">
									<h3>�������</h3>
								</div>
								<input type="radio"	name="menu_size" value="15" checked onclick="SelMenuClass()"/> 15cm &nbsp;&nbsp;&nbsp;
								<input type="radio" name="menu_size" value="30" onclick="SelMenuClass()"/> 30cm
							</div>
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3">
									<select id="menu_class" name="menu_class" onchange="SelMenuClass()">
									<option value="All" selected>��ü����</option>
										<%
										try {
											ArrayList menu_classList = dao.MenuClassList();
											for (int i = 0; i < menu_classList.size(); i++) {
												OrderDto dto = (OrderDto) menu_classList.get(i);
												String menu_class= "";
												String selected = "";
												if(dto.getMenu_class().equals("best")){
													menu_class = "����Ʈ";
												}else if(dto.getMenu_class().equals("classic")){
													menu_class = "Ŭ����";
												}else{
													menu_class = "�����̾�";
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
									<!-- �޴��� for�� ���� �κ�  -->
								<div class="col-md-9">
									<div class="col-md-12" id="Html_MenuList">
									
									</div>
									<!-- �޴��� for�� ���� �κ� �� -->
								</div>
							</div>
						</div>
							<!-- �޴� ���� ��-->
							<!--  ä�� ���� ���� -->
						<div class="col-md-12" id="vegetableSel">
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3"><h3>ä�Ҽ���</h3></div>
							</div>
							<!-- ä��  -->
							<div class="col-md-12 padding" style="padding-top: 20px;">
								<div class="col-md-3">
									<button class="btn btn-primary" id="AllVegetable">All</button>
								</div>
								<!-- ä�ҵ� for�� ���� �κ�  -->
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
									<!-- �޴��� for�� ���� �κ� �� -->
							</div>
						</div>
							<!--  ä�� ���� �� -->
							<!-- ���� -->
						<div style="height: 50px; padding-top:20px; padding-bottom:20px;">&nbsp;</div>
							<!-- ���� -->
							
							<!-- �ҽ� ���� -->
						<div class="col-md-12 padding" id="sauceSel">
							<div class="col-md-3">
								<h3>�ҽ�����</h3>
							</div>
							<div class="col-md-9 ">
								<div class="col-md-12 padding" id="bestSauceHtml" style="display:none;"></div>
								<div class="col-md-12 padding" >
									<div class="col-md-4 padding " style="height:150px;">
									<label>�����Ѽҽ�</label>
										<%
											try {
												String sauce_class = "�����Ѽҽ�";
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
										<label>�����Ѽҽ�</label>
										
										<%
											try {
												String sauce_class = "�����Ѽҽ�";
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
										<label>����Ѽҽ�</label>
										
										<%
											try {
												String sauce_class = "����Ѽҽ�";
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
										<label>�����Ѽҽ�</label>
										
										<%
											try {
												String sauce_class = "�����Ѽҽ�";
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
										<label>�Ϲݼҽ�</label>
										
										<%
											try {
												String sauce_class = "�Ϲݼҽ�";
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
									<input type="checkbox" name="favorite" value="ok" style="padding-left:5px;"/>�� ���ã�� �߰�
								</label>
							</div>
						</div>
						
						<!-- �ҽ��� -->
						<div class="col-md-12 padding">
							<aside class="box success_box">
								<table >
									<tbody>
										<tr>
											<td style="text-align:center; width:50%;"><h4>�޴� �̸�</h4> </td>
											<td style="text-align:center; width:25%;"><h4>����</h4></td>
											<td style="text-align:center; width:25%;"><h4>����</h4></td>
										</tr>
										<tr>
											<td id="Html_menu_name" style="text-align:center;"></td>
											<td id="Html_basic_price" style="text-align:center;"></td>
											<td style="text-align:center;"><input type="text" class="form-control" placeholder="�����Է�" id="Menu_count" name="count" onblur="Menu_CountPrice()"/></td>
										</tr>
										<tr>
											<td colspan="3" style="text-align:right;">
											<h4>�հ� : <span id="Html_CountPrice" style="padding-left:20px; padding-right:20px;"></span></h4>
												<input type="hidden" id="CountPirce" name="CountPirce"/>
											</td>
										</tr>
									</tbody>
								</table>
							</aside>
						</div>
						<div class="col-md-12">
							<div class="col-md-6">
								<button class="btn btn-primary" id="Order_Save">�ֹ��ϱ�</button>
							</div>
							<div class="col-md-6">
								<button class="btn btn-primary" id="DetailOrder_Save">�ٸ��޴� �ֹ��ϱ�</button>
							</div>
						</div>	
					</div>
					<div class="col-md-12 padding" id="side_menu" style="display:none;">
						<div class="col-md-3">
							<select id="sidemenu_category" name="sidemenu_category" onchange="SelSideMenuClass()">
							<option value="All" selected>��ü����</option>
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
											<th style="text-align:center; width:15%"><h4>���� ���</h4></th>
											<th style="text-align:center; width:30%"><h4>�޴� �̸�</h4> </th>	
											<th style="text-align:center; width:15%"><h4>����</h4></th>
											<th style="text-align:center; width:20%"><h4>����</h4></th>
											<th style="text-align:center; width:20%"><h4>�հ�</h4></th>
										</tr>
										<tbody id="Html_SideAppend">
										</tbody>
										<tr>
											<td colspan="5" style="text-align:right;">
											<h4>�� �հ� : <span id="HtmlSide_CountPrice" style="padding-left:20px; padding-right:20px;"></span></h4>
												<input type="hidden" id="SideCountPrice" name="SideCountPrice"/>
											</td>
										</tr>
							
								</table>
							</aside>
						</div>
						<div class="col-md-12">
							<div class="col-md-6">
								<button class="btn btn-primary" id="SideOrder_Save">�ֹ��ϱ�</button>
							</div>
							<div class="col-md-6">
								<button class="btn btn-primary" id="">�ٸ��޴� �ֹ��ϱ�</button>
							</div>
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
					<h3>��� ã��</h3>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>�޴�</th>
							<th>���γ���</th>
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
						<span>�� : <%=dto.getBread_name()%></span><br>
						<span>ä�� :
						 <%
							ArrayList VegetableList = dao.VegetableOrderList(dto.getVegetable_no_List());
							for(int j=0; j<VegetableList.size(); j++){
								%>
									<%=VegetableList.get(j)%>
								<%
							}
						%>
						</span><br>
						<span>�ҽ� :
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
					<button class="btn btn-primary" data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
	
		<!-- �����ֱ� -->
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
			// ���ã�� ��� 
			$("#Favorites").click(function() {
				$("#FavoriteList").modal();
			});
			//��ä ��ü����
			$("#AllVegetable").click(function(){
				VegetableCheckAll();
			});
			//���õ� �ҽ� ����
			$("#selectSauce").click(function(){
				selectSauRow();
			});
			$("input[name='menu_size']").click(function(){
				var size = $(":radio[name='menu_size']:checked").val();
			});
			$("#Order_Save").click(function(){
				SelectValues();
			});
			$("#SideOrder_Save").click(function(){
				SideOrderSave();
			});
		
		});
		
		var check = false;
		//ä�� ��μ��� or ��������
		function VegetableCheckAll(){
			var chk = document.getElementsByName("vegetable_no[]");
			if(check == false){
				check = true;
				for(var i=0; i<chk.length;i++){                                                                    
					chk[i].checked = true;     //��� üũ
				}
			}else{
				check = false;
				for(var i=0; i<chk.length;i++){                                                                    
					chk[i].checked = false;     //��� ����
				}
			}
		}
		
		//���õ� ä���� �� �θ���
		function selectVegRow() {
			var chk = document.getElementsByName("vegetable_no[]"); // üũ�ڽ���ü�� ��´�
			var len = chk.length;    //üũ�ڽ��� ��ü ����
			var checkRow = '';      //üũ�� üũ�ڽ��� value�� ������� ����
			var checkCnt = 0;        //üũ�� üũ�ڽ��� ����
			var checkLast = '';      //üũ�� üũ�ڽ� �� ������ üũ�ڽ��� �ε����� ������� ����
			var rowid = '';             //üũ�� üũ�ڽ��� ��� value ���� ��´�
			var cnt = 0;                 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
				checkCnt++;        //üũ�� üũ�ڽ��� ����
				checkLast = i;     //üũ�� üũ�ڽ��� �ε���
				}
			} 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //üũ�� �Ǿ��ִ� �� ����
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //üũ�� üũ�ڽ��� ������ �� �� �϶�,
						rowid += checkRow;        //'value'�� ���� (�ڿ� ,(�޸�)�� �����ʰ�)
					}else{                                            //üũ�� üũ�ڽ��� ������ ���� �� �϶�,
						if(i == checkLast){                     //üũ�� üũ�ڽ� �� ������ üũ�ڽ��� ��,
							rowid += checkRow;  //'value'�� ���� (�ڿ� ,(�޸�)�� �����ʰ�)
						}else{
							rowid += checkRow+"|";	 //'value',�� ���� (�ڿ� ,(�޸�)�� �ٰ�)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow�ʱ�ȭ.
				}
				$("#VegetableList").val(rowid);
			}
		}
		
		//�ҽ� üũ�Ȱ� Ȯ�� 3���̻��ϰ�� ���Ѿ�� 
		//�ƴҰ�쿡 �ҽ� value ���� SelectSauceValue���ٰ� �ֱ� |������ �����ϱ�
		function selectSauRow() {
			var chk = document.getElementsByName("sauce_no[]");
			var len = chk.length;    //üũ�ڽ��� ��ü ����
			var checkRow = '';      //üũ�� üũ�ڽ��� value�� ������� ����
			var checkCnt = 0;        //üũ�� üũ�ڽ��� ����
			var checkLast = '';      //üũ�� üũ�ڽ� �� ������ üũ�ڽ��� �ε����� ������� ����
			var rowid = '';             //üũ�� üũ�ڽ��� ��� value ���� ��´�
			var cnt = 0;                 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
				checkCnt++;        //üũ�� üũ�ڽ��� ����
				checkLast = i;     //üũ�� üũ�ڽ��� �ε���
				}
			} 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //üũ�� �Ǿ��ִ� �� ����
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //üũ�� üũ�ڽ��� ������ �� �� �϶�,
						rowid += checkRow;        //'value'�� ���� (�ڿ� ,(�޸�)�� �����ʰ�)
					}else{                                            //üũ�� üũ�ڽ��� ������ ���� �� �϶�,
						if(i == checkLast){                     //üũ�� üũ�ڽ� �� ������ üũ�ڽ��� ��,
							rowid += checkRow;  //'value'�� ���� (�ڿ� ,(�޸�)�� �����ʰ�)
						}else{
							rowid += checkRow+"|";	 //'value',�� ���� (�ڿ� ,(�޸�)�� �ٰ�)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow�ʱ�ȭ.
				}
			}
			if(checkCnt > 3){
				alert("�ҽ��� 3���� ���� ���� �����մϴ�.");
				$("#sauce").focus();
			}else{
				$("#SelectSauceValue").val(rowid);
			}
		}
		// �޴� class ���ý� ������ ��
		function SelMenuClass(){
			var menuclass = $("#menu_class").val();
			var size = $(":radio[name='menu_size']:checked").val();
			var param = "class="+menuclass+"&size="+size;
			sendRequest("POST", "menuSelectClass.jsp", MenuClassback, param);
			
	
		}
		// �޴� html ����
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
		//���̵� �޴� ����Ʈ
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
		
		
		// ���� ���� 
		function SelManagerAddr(){
			var manageraddr = $("#manage_addr").val();
			var param = "manager_addr=" + manageraddr;
			sendRequest("POST","managerSelect.jsp", Addrback ,param);
		}
		// �����̸� ������ �� �κ�
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
		//�޴� ����Ʈ �ҽ� �˱�
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
				alert("������ ������ �ּ���.");
				return;
			}
			if(bread_no == null){
				alert("�������� ������ �ּ���");
				return;
			}
			if(menu_no == null){
				alert("�޴��� ������ �ּ���.");
				return;
			}
		
			if($("#VegetableList").val()==""){
				alert("ä�Ҹ� ���� �� �ּ���.");
				return;
			}
			if($("#SelectSauceValue").val()==""){
				alert("�ҽ��� ���� �� �ּ���.");
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
					alert("���� ����!");
					location.href="OrderList.jsp";
			 		//	alert(httpRequest.responseText);
			 	}else{
					alert(httpRequest.status);
				}
			}	
	
		}
		//���ã�� ���� �÷�����
		function FavoriteCilck(menu, size, bread, vegetable, sauce){
			//alert("menu = " +menu+ "size= " + size+ "bread =" + bread + "vegetable =" + vegetable + "sauce = " +sauce  );
			$("input:radio[name='menu_size']:radio[value='"+size+"']").prop("checked",true);
			$("input:radio[name='bread_no']:radio[value='"+bread+"']").prop("checked",true);
			//ä�Ҹ���Ʈ �Ѿ�°Ϳ� split �Ͽ� ������ value �´°ſ� üũ�ϰ� �ϱ�
			var vegetableList = vegetable.split('|');
			for( var i in vegetableList ){
				$("input:checkbox[name='vegetable_no[]']:checkbox[value='"+vegetableList[i]+"']").prop("checked",true);		
			}
			//�ҽ�����Ʈ �Ѿ�°Ϳ� split �Ͽ� for������ ������ value �´°ſ� üũ�ϰ� �ϱ�
			var sauceList = sauce.split('|');
			for(var i in sauceList){
				$("input:checkbox[name='sauce_no[]']:checkbox[value='"+sauceList[i]+"']").prop("checked",true);
			}
		
			$("input:radio[name='menu_no']:radio[value='"+menu+"']").prop("checked",true) ;
			
			$("#FavoriteList").modal('hide');
			  ViewPrice();
		}
		
	
		// ���̵� �޴� �����ΰ� ������ġ �����ΰ�
		function ListView(list){
			if(list =="side"){
				$("#Sandwich").css("display","none");
				$("#side_menu").css("display","");
				$("#OrderTypes").val("side");
				SelSideMenuClass();
			}else{
				$("#Sandwich").css("display","");
				$("#side_menu").css("display","none");
				$("#OrderTypes").val("bread");
			}
		}
		// check�ڽ��� checked �Ǿ������� ���̺� �� �߰� �ƴҽ� ���� 
		function SelCheckbox(side_no){
			var checked = $("input:checkbox[id='side_menu_no_"+side_no+"']").is(":checked");
			if(checked == true){
				$("#Html_SideAppend").append('<tr id="Html_TrAppeand_'+side_no+'"><td><input type="hidden" name="no" value="'+side_no+'"/><button class="btn btn-danger" onclick="SideMenuDel('+side_no+')">�������</button></td><td id="Html_side_menu_name_'+side_no+'" style="text-align:center;"></td><td id="Html_side_basic_price_'+side_no+'" style="text-align:center;"></td><td style="text-lign:center;"><input type="text" class="form-control" placeholder="������ �Է����ּ���" id="SideMenu_count_'+side_no+'" name="sidemenu_count" onblur="SideMenu_CountPrice('+side_no+')"/></td><td id="SideCountPrice_'+side_no+'"></td><input type="hidden" name="side_countprice" id="hidden_countPrice_'+side_no+'"/></tr>');			
			}else{
				SideMenuDel(side_no);
			}
			
			HtmlSelectSide(side_no);
			
		}
		// append�� ���̺��� ���� �ɶ����� ���̵� �޴��� �̸��� ���ݵ��� �ҷ��´�.
		function HtmlSelectSide(side_no){
			var sidemenu_name = $("#sidemenu_name_"+side_no).val();
			var sidebasic_price = $("#sidebasic_price_"+side_no).val();
			$("#Html_side_menu_name_"+side_no).html(sidemenu_name);
			$("#Html_side_basic_price_"+side_no).html(sidebasic_price);
			$("#Html_side_menu_name_"+side_no).val(sidemenu_name);
			$("#Html_side_basic_price_"+side_no).val(sidebasic_price);
		}
		// ���̵� �޴��� �������� �Է��ϸ�, ���� ��� 
		function SideMenu_CountPrice(side_no){
			var sidebasicprice = $("#Html_side_basic_price_"+side_no).val();
			var sidecount = $("#SideMenu_count_"+side_no).val();
			
			var sidecountPrice = sidebasicprice * sidecount;
			
			$("#SideCountPrice_"+side_no).html(sidecountPrice);
			$("#SideCountPrice_"+side_no).val(sidecountPrice);
			$("#hidden_countPrice_"+side_no).val(sidecountPrice);
			TotalSidePrice(null,side_no);
		}
		var TotalPrice = 0;
		// ���ݵ��� Total ������ ���հ踦 ����.
		function TotalSidePrice(price,side_no){
			var SideCountPrices =  $("#SideCountPrice_"+side_no).val();
		//	alert(SideCountPrices);
			if(price == null){
				TotalPrice += parseInt(SideCountPrices);
			}else{
				TotalPrice -= parseInt(price);	
			}
			$("#SideCountPrice").val(TotalPrice);
			$("#HtmlSide_CountPrice").html(TotalPrice);
		}
		// ���̵� �޴� ���� ��� ������ ����, ���̺��� ����, üũ Ǯ��
		function SideMenuDel(side_no){
			var price = $("#SideCountPrice_"+side_no).val();
			$("input:checkbox[id='side_menu_no_"+side_no+"']").prop("checked",false);
			TotalSidePrice(price,side_no);
			$("#Html_TrAppeand_"+side_no).remove();
		}
		function SideOrderSave(){
			 var param = $("#OrderSaveForm").serialize();
			// alert(param);
			 sendRequest("POST","OrderSave.jsp", DetailOrderSaveBack,param);	
		}
		
	</script>

</body>
</html>