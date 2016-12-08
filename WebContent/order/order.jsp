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
					<label class="col-md-3" >매장 선택</label>
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
			</div>
		</div>
	</div>
	<footer>
	<%@ include file="../include/footer.jsp"%>
</footer>
</section>
</body>
</html>