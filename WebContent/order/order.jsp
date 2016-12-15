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
					<!-- 메뉴 선택 시작-->
					<div class="col-md-12" style="padding-top: 20px;">
						<label class="col-md-2">메뉴선택</label>
						<button id="Favorites" class="btn btn-primary">★ 즐겨찾기</button>
					</div>
					<div class="col-md-12" style="padding-top: 20px;">
						<label class="col-md-2">사이즈선택</label> <input type="radio"
							name="menu_size" value="15" /> 15cm &nbsp;&nbsp;&nbsp; <input
							type="radio" name="menu_size" value="30" /> 30cm
					</div>

					<div class="col-md-12" style="padding-top: 20px;">
						<div class="col-md-3">
							<select name="class">
								<option value="클래식">클래식</option>
								<option value="프리미엄">프리미엄</option>
								<option value="베스트">베스트</option>
							</select>
						</div>

						<!-- 메뉴들 for문 돌릴 부분  -->
						<div class="col-md-9">
							<div class="col-md-12">

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="메뉴 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											가격 정보
											<hr>
											<span>치킨 한스콜</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="메뉴 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											가격 정보
											<hr>
											<span>치킨 한스콜</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
								<div style="text-align: center">
										<input type="radio" name="menu_no" value="메뉴 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											가격 정보
											<hr>
											<span>치킨 한스콜</span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="메뉴 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											가격 정보
											<hr>
											<span>치킨 한스콜</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="radio" name="menu_no" value="메뉴 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											가격 정보
											<hr>
											<span>치킨 한스콜</span>
										</div>
									</div>
								</div>

								<div class="col-md-4" style="border-color: aqua; border: solid;">
								<div style="text-align: center">
										<input type="radio" name="menu_no" value="메뉴 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											가격 정보
											<hr>
											<span>치킨 한스콜</span>
										</div>
									</div>
								</div>
				
								

							</div>
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

						<!-- 메뉴들 for문 돌릴 부분  -->
						<div class="col-md-9">
							<div class="col-md-12">

								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="채소 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>채소 이름</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="채소 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>채소 이름</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="채소 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>채소 이름</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="채소 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>채소 이름</span>
										</div>
									</div>
								</div>
								
								<div class="col-md-4" style="border-color: aqua; border: solid;">
									<div style="text-align: center">
										<input type="checkbox" name="vegetable_no" value="채소 id값" />
									</div>
									<div class="cmsms_our_team">
										<div class="wrap_person">
											<img src="../lib/images/menu/best_CT.PNG" class="fullwidth"
												alt="female-practitioner-s-1">
										</div>
										<hr>
										<div>
											<span>채소 이름</span>
										</div>
									</div>
								</div>

							

							</div>
						</div>
						<!-- 메뉴들 for문 돌릴 부분 끝 -->
					</div>
					
					<!--  채소 선택 끝 -->
					
					
					

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