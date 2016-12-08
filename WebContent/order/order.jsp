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
					<div class="col-md-12">
						<button id="Favorites" class="btn btn-primary">�� ���ã��</button>
					</div>
				</div>
			</div>
		</div>

		<div class=" modal fade" id="theModal" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3>��� ���</h3>
					</div>
					<div class="modal-body">
						<p>���� ����....</p>
						<p>���� ����....</p>
						<p>���� ����....</p>

					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal">�ݱ�</button>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</section>
	<script src="../lib/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.js"></script>
	<script>
		$(function() {
			$("#Favorites").click(function() {
				$("#theModal").modal();
			});
		});
	</script>

</body>
</html>