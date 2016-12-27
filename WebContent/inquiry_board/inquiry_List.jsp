<%@page import="java.util.List"%>
<%@page import="inquiry.InquiryDto"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css"
	type="text/css" charset="utf-8" />
<script
	src="../lib/daumeditor/js/editor_loader.js?environment=development"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
</head>
<body class="page">
	<jsp:useBean id="dao" class="inquiry.InquiryDao" />
	<%
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		List list = dao.getBoardList(keyField, keyWord);
		AccountDao ad = new AccountDao();
		AccountDto accountdto = ad.session(session.getAttribute("id"));

		//////////////////////////////////////////////
		// Paging 기법

		int totalRecord = 0; // 전체 글의 갯수
		int numPerPage = 5; // 한 페이지 당 보여질 글의 갯수
		int pagePerBlock = 3; // 한 블럭 당 페이지 수
		int totalPage = 0; // 전체 페이지 수
		int totalBlock = 0; // 전체 블록의 수
		int nowPage = 0; // 현재 페이지 번호
		int nowBlock = 0; // 현재 블럭 번호
		int beginPerPage = 0; // 페이지 당 시작번호

		totalRecord = list.size();
		totalPage = (int) Math.ceil(((double) totalRecord / numPerPage));
		totalBlock = (int) Math.ceil(((double) totalPage / pagePerBlock));

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		beginPerPage = nowPage * numPerPage;
	%>
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<div class="col-md-12">
					<form action="inquiry_List.jsp" name="search" method="post">
						<div align="right" style="margin-right:auto;">
							<div class="col-md-3" >
								<select name="keyField" size="1">
										<option value="title">제목
										<option value="account_name">글쓴이
										<option value="content">내용
								</select> 
							</div>
							<div class="col-md-3">
								<input type="text" size="16" name="keyWord"> 
								<button type="submit" value="검색" class="btn btn-info" onClick="check()" >
									<span class="glyphicon glyphicon-search"></span>
								</button>
								<input type="hidden" name="page" value="0">
							</div>
						</div>
					</form>
					
					<table border=1 width=100% cellpadding=2 cellspacing=0 class="table table-bordered table-hover table-condensed table-striped">
						   <thead>
                           <tr align=center height=120%>
							<td width=10% name=board_no>No</td>
							<td width=10% name=category>카테고리</td>
							<td width=60% name=title>제목</td>
							<td width=10% name=account_name>글쓴이</td>
							<td width=10% name=date>날짜</td>
							</tr>
                           </thead>
                           <tbody>
									<%
										if (list.size() == 0) {
									%>
									<tr>
										<td>등록된 글이 없습니다.</td>
									</tr>
									<%
										} else {
											for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
												if (i == totalRecord)
													break;

												InquiryDto dto = (InquiryDto) list.get(i);
									%>
									<tr align="center">
										<td><%=dto.getBoard_no()%></td>
										<td>
<%
										if(dto.getCategory().equals("답변")) {
%>
											<img src="../lib/images/re.gif" /><%=dto.getCategory()%></td>	
<%
										} else {
%>
										<%=dto.getCategory()%></td>					
<%
										}
%>
										<td><a href="inquiry_Read.jsp?account_no=<%=accountdto.getAccount_no() %>&board_no=<%=dto.getBoard_no()%>"><%=dto.getTitle()%></a></td>
										<td><%=dto.getAccount_name()%></td>
										<td><%=dto.getDate()%></td>
									</tr>
<%
										}
									}
%>
						</tbody>
					</table>
					
					<div class="col-md-12">
						<div class="col-md-4">
							<%
						 	if (nowBlock > 0) {
%>
							<a href="inquiry_List.jsp?nowBlock=<%=nowBlock - 1%>&nowPage=<%=(nowBlock - 1) * pagePerBlock%>">이전 <%=pagePerBlock%>개
							</a>:::&nbsp;&nbsp;&nbsp; 
<%
 							}
%>
<%
			 				for (int i = 0; i < pagePerBlock; i++) {
 								if (i + (nowBlock * pagePerBlock) == totalPage)
 									break;
 %>
 								<a href="inquiry_List.jsp?nowPage=<%=i + (nowBlock * pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i + 1 + (nowBlock * pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
<%
							}
%>
<%
 							if (totalBlock > nowBlock + 1) {
 %> 
 								::: <a href="inquiry_List.jsp?nowBlock=<%=nowBlock + 1%>&nowPage=<%=(nowBlock + 1) * pagePerBlock%>">다음 <%=pagePerBlock%>개 </a> 
<%
 							}
 %>
						</div>
						<div class="col-md-4">
							<input type="button" id="write" value="글쓰기" class="btn btn-default" onClick="location.href='inquiry_Post.jsp'"/>
							<input type="button" id="lsit" value="목록" class="btn btn-default" onClick="location.href='inquiry_List.jsp'"/>
						</div>
					</div>			
					
					<BR>
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
			$.ajax({
				type : "POST",
				url : "../lib/daumeditor/editor_template.html",
				success : function(data) {
					$("#editorTd").html(data);
					setConfig();
				},
				error : function(request, status, error) {
					alert("에러");
				}
			});
		})

		function setConfig() {
			var config = {
				txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
				txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
				txService : 'sample', /* 수정필요없음. */
				txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
				initializedId : "", /* 대부분의 경우에 빈문자열 */
				wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
				form : 'tx_editor_form' + "", /* 등록하기 위한 Form 이름 */
				txIconPath : "/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
				txDecoPath : "/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
				canvas : {
					styles : {
						color : "#123456", /* 기본 글자색 */
						fontFamily : "굴림", /* 기본 글자체 */
						fontSize : "10pt", /* 기본 글자크기 */
						backgroundColor : "#fff", /*기본 배경색 */
						lineHeight : "1.5", /*기본 줄간격 */
						padding : "8px" /* 위지윅 영역의 여백 */
					},
					showGuideArea : false
				},
				events : {
					preventUnload : false
				},
				sidebar : {
					attachbox : {
						show : true,
						confirmForDeleteAll : true
					}
				},
				size : {
					contentWidth : 700
				/* 지정된 본문영역의 넓이가 있을 경우에 설정 */
				}
			};
			EditorJSLoader.ready(function(Editor) {
				editor = new Editor(config);
			});
		}
	</script>


</body>
</html>