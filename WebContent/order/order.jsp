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
					<li>������ġ</li>
					<li>������</li>
					<li>���̵�޴�</li>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="col-md-12">
					<label class="col-md-3">���� ����</label>
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
					<div class="col-md-4" id="manage_name">
					</div>
				</div>
					<!-- �޴� ���� ����-->
				<div class="col-md-12" style="padding-top: 20px;">
					<label class="col-md-2">�޴�����</label>
					<button id="Favorites" class="btn btn-primary">�� ���ã��</button>
				</div>
				<div class="col-md-12" style="padding-top: 20px;">
					<label class="col-md-2">�������</label> 
					<input type="radio"	name="menu_size" value="15" checked onclick="SelMenuClass()"/> 15cm &nbsp;&nbsp;&nbsp;
					<input type="radio" name="menu_size" value="30" onclick="SelMenuClass()"/> 30cm
				</div>
				<div class="col-md-12" style="padding-top: 20px;">
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
					<!-- �޴� ���� ��-->
					<!--  ä�� ���� ���� -->
					<div class="col-md-12" style="padding-top: 20px;">
						<label class="col-md-2">ä�Ҽ���</label>
					</div>
					<div class="col-md-12" style="padding-top: 20px;">
						<div class="col-md-3">
							<button class="btn btn-primary" id="AllVegetable">All</button>
						</div>

						<!-- ä�ҵ� for�� ���� �κ�  -->
						<div class="col-md-9">
							<div class="col-md-12">
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

								} catch (Exception err) {
									System.out.println("index.jsp : " + err);
								}
								%>
								<input type="text" id="VegetableList"/>
							</div>
						</div>
						<!-- �޴��� for�� ���� �κ� �� -->
					</div>
					
					<!--  ä�� ���� �� -->
					<!-- ���� -->
					<!-- ���� -->
					
					<!-- �ҽ� ���� -->
					<div id="sauce">
						<div class="col-md-2">
							�ҽ�����
						</div>
						<div class="col-md-10">
							<div class="col-md-12"id="bestSauceHtml"></div>
							<div class="col-md-12">
							<label>�����Ѽҽ�</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "�����Ѽҽ�";
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
							<label>�����Ѽҽ�</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "�����Ѽҽ�";
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
							<label>����Ѽҽ�</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "����Ѽҽ�";
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
							<label>�����Ѽҽ�</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "�����Ѽҽ�";
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
							<label>�Ϲݼҽ�</label>
							<div class="sauce_class">
							<%
								try {
									String sauce_class = "�Ϲݼҽ�";
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
						<button id="selectSauce">��ư</button>
					</div>
				</div>
				<!-- �ҽ��� -->
			</div>
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
							<th>����</th>
						</tr>
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
	Html_MenuList();
	
		$(function() {
			// ���ã�� ��� 
			$("#Favorites").click(function() {
				$("#FavoriteList").modal();
			});
			//��ä ��ü����
			$("#AllVegetable").click(function() {
				VegetableCheckAll();
			});
			//���õ� �ҽ� ����
			$("#selectSauce").click(function(){
				selectSauRow();
			});
			$("input[name='menu_size']").click(function(){
				var size = $(":radio[name='menu_size']:checked").val();
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
			alert(checkCnt);
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
			 		alert(httpRequest.responseText);
			 	}else{
					alert(httpRequest.status);
				}
			}
		}
		//�޴� ����Ʈ �ҽ� �˱�
		function Menu_Bestsauce(){
			ViewPrice();
			var menu_no = $(":radio[name='List_menuno']:checked").val();
			var param = "menu_no=" + menu_no;
			sendRequest("POST","bestSauce.jsp", Sauceback ,param);
		}
		
		function Sauceback(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var div = document.getElementById("bestSauceHtml");
			 		div.innerHTML = httpRequest.responseText;
			 		alert(httpRequest.responseText);
			 	}else{
					alert(httpRequest.status);
				}
			}	
		}
		function ViewPrice(){
			var menu_no = $(":radio[name='List_menuno']:checked").val();
			var basic_price = $("#basic_price_"+menu_no).val();
			
		}
		
	</script>

</body>
</html>