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
					<label class="col-md-3" >���� ����</label>
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
			</div>
		</div>
	</div>
	<footer>
	<%@ include file="../include/footer.jsp"%>
</footer>
</section>
</body>
</html>