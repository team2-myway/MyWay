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
				<h2>�Խ��� ����</h2>
				<div class="col-md-12">
					<form name="tx_editor_form" id="tx_editor_form"
						action="/insert.jsp" method="post" accept-charset="utf-8">
						<table width="100%" >
							<tr>
								<td width=10% >�� ��</td>
								<td width=100% ><input type=text name=name size=10 maxlength=20></td>
							</tr>
							<tr>
								<td width=10% >ī�װ�</td>
								<td width=100% ><input type=text name=name size=10 maxlength=20></td>
							</tr>
							
							<tr>
								<td>����</td>
								<td cellspacing=0 cellpadding=2 id="editorTd"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" id="save" class="btn btn-primary" value="����" />
									<input type="button" class="btn btn-danger" value="���" /></td>
							</tr>
						</table>
					</form>
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
	$(function(){
		$.ajax({
	        type:"POST", 
	        url: "../lib/daumeditor/editor_template.html",
	        success: function(data){
	        	$("#editorTd").html(data);
	        	setConfig();
	        }, 
	        error : function(request, status, error) {
				alert("����");
			}
		});	
	})
	
	function setConfig(){
		var config = {
				txHost: '', /* ��Ÿ�� �� ���ҽ����� �ε��� �� �ʿ��� �κ�����, ��ΰ� ����Ǹ� �� �κ� ������ �ʿ�. ex) http://xxx.xxx.com */
				txPath: '', /* ��Ÿ�� �� ���ҽ����� �ε��� �� �ʿ��� �κ�����, ��ΰ� ����Ǹ� �� �κ� ������ �ʿ�. ex) /xxx/xxx/ */
				txService: 'sample', /* �����ʿ����. */
				txProject: 'sample', /* �����ʿ����. ������Ʈ�� �������� ��츸 �����Ѵ�. */
				initializedId: "", /* ��κ��� ��쿡 ���ڿ� */
				wrapper: "tx_trex_container", /* �����͸� �ѷ��ΰ� �ִ� ���̾� �̸�(������ �����̳�) */
				form: 'tx_editor_form'+"", /* ����ϱ� ���� Form �̸� */
				txIconPath: "/daumeditor/images/icon/editor/", /*�����Ϳ� ���Ǵ� �̹��� ���͸�, �ʿ信 ���� �����Ѵ�. */
				txDecoPath: "/daumeditor/images/deco/contents/", /*������ ���Ǵ� �̹��� ���͸�, ���񽺿��� ����� ���� �ϼ��� �������� �����Ǳ� ���� �����η� �����Ѵ�. */
				canvas: {
					styles: {
						color: "#123456", /* �⺻ ���ڻ� */
						fontFamily: "����", /* �⺻ ����ü */
						fontSize: "10pt", /* �⺻ ����ũ�� */
						backgroundColor: "#fff", /*�⺻ ���� */
						lineHeight: "1.5", /*�⺻ �ٰ��� */
						padding: "8px" /* ������ ������ ���� */
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
					contentWidth: 700 /* ������ ���������� ���̰� ���� ��쿡 ���� */
				}
			};
			EditorJSLoader.ready(function(Editor) {
				editor = new Editor(config);
			});
}
	
	</script>
	

</body>
</html>