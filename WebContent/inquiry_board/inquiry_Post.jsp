<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="../lib/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	window.onload = function() {
		var session_id = <%=session.getAttribute("id") %>;
		if(session_id == null) {
			alert("회원만 작성할 수 있습니다.");
			history.back();
		}
	}
	function check(){
		if(document.post_form.title.value == ""){
			alert("제목을 입력하세요.");
			document.post_form.title.focus();
			return;
		}
		document.post_form.submit();
	}
</script>
<script>
function validForm(editor){
	var validator = new Trex.Validator();
	var content = editor.getContent();
	if (!validator.exists(content)) {
		alert('내용을 입력하세요');
		return false;
	}
  return true;
}

//validForm 함수가 true로 return된 후에 동작하는 함수
function setForm(editor) {
        var form = editor.getForm();
        var content = editor.getContent();
        var textarea = document.createElement('textarea');
        //textarea를 생성하여 해당태그에 에디터 입력값들을 신규생성 textarea에 담는다
        textarea.name = 'content';
        textarea.value = content;
        form.createField(textarea);
     return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="page">
<%
	request.setCharacterEncoding("UTF-8");
	AccountDao adao = new AccountDao();
	AccountDto adto = new AccountDto();
	adto = adao.session(session.getAttribute("id"));
	
%>
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
				<div class="col-md-12">
					<form name="post_form" id="tx_editor_form" action="inquiry_PostProc.jsp?account_no=<%=adto.getAccount_no()%>" method="post" accept-charset="utf-8">
						<table>
							<tr>
								<td align=left>제 목</td>
								<td><input type=text name=title size=40 maxlength=20></td>
							</tr>
							<tr>	
								<td>카테고리</td>
								<td>
								<select name="category">
										<option value="공지">공지</option>
										<option value="문의" selected>문의</option>
								</select>
								</td>
							</tr>
							<tr>	
								<td>이름</td>
                        		<td><input type=text name=account_name size=40 maxlength=20 value="<%=adto.getAccount_name()%>"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td id="editorTd"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" id="save" value="저장" onClick="check()"/>
									<input type="reset" value="다시쓰기" /></td>
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
		$("#save").click(function(){
			Editor.save(); 
		})
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
				txIconPath: "../lib/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
				txDecoPath: "../lib/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
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