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
				<div class="col-md-3">
					<ul>
						<li>������ġ</li>
						<li>������</li>
						<li>���̵�޴�</li>
					</ul>
				</div>
				<div class="col-md-9">
					<div class="col-md-12">
						<label class="col-md-3">���� ����</label>
						<div class="col-md-3">
							<select id="manage_addr">
								<option>����</option>
								<option>���</option>
								<option>�λ�</option>
							</select>
						</div>
						<div class="col-md-3">
							<select id="manage_name">
								<option>ȭ����</option>
								<option>�λ���</option>
								<option>������</option>
							</select>
						</div>
					</div>
					<!-- �޴� ���� ����-->
					<div class="col-md-12" style="padding-top: 20px;">
						<label class="col-md-2">�޴�����</label>
						<button id="Favorites" class="btn btn-primary">�� ���ã��</button>
					</div>
					<div class="col-md-12" style="padding-top: 20px;">
						<label class="col-md-2">�������</label> <input type="radio"
							name="menu_size" value="15" /> 15cm &nbsp;&nbsp;&nbsp; <input
							type="radio" name="menu_size" value="30" /> 30cm
					</div>

					<div class="col-md-12" style="padding-top: 20px;">
						<div class="col-md-3">
							<select name="class">
								<option value="Ŭ����">Ŭ����</option>
								<option value="�����̾�">�����̾�</option>
								<option value="����Ʈ">����Ʈ</option>
							</select>
						</div>

						<!-- �޴��� for�� ���� �κ�  -->
						<div class="col-md-9">
							<div class="col-md-12">

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="�޴� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											���� ����
											<hr>
											<span>ġŲ �ѽ���</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="�޴� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											���� ����
											<hr>
											<span>ġŲ �ѽ���</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
								<div style="text-align: center">
										<input type="radio" name="menu_no" value="�޴� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											���� ����
											<hr>
											<span>ġŲ �ѽ���</span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="�޴� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											���� ����
											<hr>
											<span>ġŲ �ѽ���</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="�޴� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											���� ����
											<hr>
											<span>ġŲ �ѽ���</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
								<div style="text-align: center">
										<input type="radio" name="menu_no" value="�޴� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											���� ����
											<hr>
											<span>ġŲ �ѽ���</span>
										</div>
									</div>
								</div>
				
								

							</div>
						</div>
						<!-- �޴��� for�� ���� �κ� �� -->
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

						<!-- �޴��� for�� ���� �κ�  -->
						<div class="col-md-9">
							<div class="col-md-12">

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="ä�� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>ä�� �̸�</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="ä�� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>ä�� �̸�</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="ä�� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>ä�� �̸�</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="ä�� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>ä�� �̸�</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="ä�� id��" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>ä�� �̸�</span>
										</div>
									</div>
								</div>

							

							</div>
						</div>
						<!-- �޴��� for�� ���� �κ� �� -->
					</div>
					
					<!--  ä�� ���� �� -->
					
					
					

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
	<script>
		$(function() {
			$("#Favorites").click(function() {
				$("#FavoriteList").modal();
			});
			$("#AllVegetable").click(function() {
				$("input[name=vegetable_no]").prop('checked', true);
			});

		});
	</script>

</body>
</html>