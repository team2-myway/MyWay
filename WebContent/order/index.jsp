<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="../lib/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<h2>게시판 예제</h2>
				<div class="col-md-12">
					<form name="tx_editor_form" id="tx_editor_form"
						action="/insert.jsp" method="post" accept-charset="utf-8">
						<table width="100%" >
							<tr>
								<td width=10% >제 목</td>
								<td width=100% ><input type=text name=name size=10 maxlength=20></td>
							</tr>
							<tr>
								<td width=10% >카테고리</td>
								<td width=100% ><input type=text name=name size=10 maxlength=20></td>
							</tr>
							
							<tr>
								<td>내용</td>
								<td cellspacing=0 cellpadding=2 id="editorTd"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" id="save" class="btn btn-primary" value="저장" />
									<input type="button" class="btn btn-danger" value="취소" /></td>
							</tr>
						</table>
					</form>
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
	$(function(){
		$.ajax({
	        type:"POST", 
	        url: "../lib/daumeditor/editor_template.html",
	        success: function(data){
	        	$("#editorTd").html(data);
	        	setConfig();
	        }, 
	        error : function(request, status, error) {
				alert("에러");
			}
		});	
	})
	
	function setConfig(){
		var config = {
				txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
				txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
				txService: 'sample', /* 수정필요없음. */
				txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
				initializedId: "", /* 대부분의 경우에 빈문자열 */
				wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
				form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
				txIconPath: "/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
				txDecoPath: "/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
				canvas: {
					styles: {
						color: "#123456", /* 기본 글자색 */
						fontFamily: "굴림", /* 기본 글자체 */
						fontSize: "10pt", /* 기본 글자크기 */
						backgroundColor: "#fff", /*기본 배경색 */
						lineHeight: "1.5", /*기본 줄간격 */
						padding: "8px" /* 위지윅 영역의 여백 */
					},
					showGuideArea: false
				},
				events: {
					preventUnload: false
				},
				sidebar: {
					attachbox: {
						show: true,
						confirmForDeleteAll: true
					}
				},
				size: {
					contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
				}
			};
			EditorJSLoader.ready(function(Editor) {
				editor = new Editor(config);
			});
}
	
	</script>
	

</body>
</html>