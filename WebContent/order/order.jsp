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
						<li>샌드위치</li>
						<li>샐러드</li>
						<li>사이드메뉴</li>
					</ul>
				</div>
				<div class="col-md-9">
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
					<div class="col-md-12">
						<button id="Favorites" class="btn btn-primary">★ 즐겨찾기</button>
					</div>
				</div>
			</div>
		</div>

		<div class=" modal fade" id="theModal" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3>모달 헤더</h3>
					</div>
					<div class="modal-body">
						<p>본문 영역....</p>
						<p>본문 영역....</p>
						<p>본문 영역....</p>

					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal">닫기</button>
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