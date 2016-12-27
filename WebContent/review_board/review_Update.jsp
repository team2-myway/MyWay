<%@page import="review.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dto" class="review.ReviewDto"></jsp:useBean>
<jsp:useBean id="dao" class="review.ReviewDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String account_no = request.getParameter("account_no");
	String review_no = request.getParameter("review_no");
	dto = dao.getReviewRead(review_no);
	ReviewDto selectdto = dao.selectManagerArea(dto.getManager_name());
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../lib/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="../lib/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<script>
	function validForm(editor) {
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
	     textarea.style="display:none";
	     form.createField(textarea);
	     return true;
	}
</script>
<script> 
	window.onload = function() { 
		$(document).ready(loadContent());
	}
	function getGrade() {
		var grade = "<%=dto.getGrade()%>";
		if( grade != null ) {
			$("input:radio[name=grade][value="+grade+"]").attr("checked","checked");
		}
	}
	// 매장 지점 
	function SelManagerAddr(){
		alert("SelManagerAddr");
		var imanager_name ="<%=dto.getManager_name ()%>";
		var manager_area = $("#manager_area").val();
	    var param = "manager_area=" + manager_area + "&manager_name=" + imanager_name;
	    sendRequest("POST","managerSelect.jsp", Addrback, param);
	}
	
	function Addrback(){
	    if(httpRequest.readyState == 4){
	       if(httpRequest.status == 200){
	          var div = document.getElementById("manager_name");
	           div.innerHTML = httpRequest.responseText;
	           //alert(httpRequest.responseText);
	        }else{
	          alert("error : " + httpRequest.status);
	       }
	    }
	 }
</script>
<script type="text/javascript">
 function loadContent() {
	var attachments = {};
	/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
	Editor.modify({
		"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
			var allattachments = [];
			for (var i in attachments) {
				allattachments = allattachments.concat(attachments[i]);
			}
			return allattachments;
		}(),
		"content": document.getElementById("content2") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
	});
	getGrade();
	SelManagerAddr();

 }
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기글 수정</title>
</head>
<body class="page">
   <section id="page" class="csstransition cmsms_resp hfeed site">
      <%@ include file="../include/header.jsp"%>
      <div class="container">
         <div class="col-md-12">
            <div class="col-md-12">
               <form name="tx_editor_form" id="tx_editor_form" action="review_UpdateProc.jsp?account_no=<%=account_no %>&review_no=<%=dto.getReview_no()%>" method="post" accept-charset="utf-8">
               	<textarea id="content2" name="content2" style="display:none"><%=dto.getContent() %></textarea>
                  <table width=80% border=0 cellspacing=0 cellpadding=3 align="center">
                     <tr>
                        <td align=left>제 목</td>
                        <td><input type=text name=title size=40 maxlength=20 value=<%=dto.getTitle()%> /></td>
                        <td>이름</td>
                        <td><input type=text name=account_name size=40 maxlength=20 value=<%=dto.getAccount_name()%> /></td>
                     </tr>
                     <tr>
                        <td>지 점</td>
						<td>
						<div>
						<div class="col-md-6">
                    	<select id="manager_area" onChange="SelManagerAddr()">
                           <option value="" width="200px;"> 지역선택</option>
                        <%
                           List areaList = dao.getManagerArea();
                           for (int i = 0; i < areaList.size(); i++) {
                        	   ReviewDto areadto = (ReviewDto) areaList.get(i);
                           %>
                           <option value="<%= areadto.getManager_area()%>" <%=areadto.getManager_area().equals(selectdto.getManager_area())?"selected=selected":"" %>><%=areadto.getManager_area()%></option>
                        <%
                        	} 

                        %>
                     </select>
                  	</div>
                  	<div class="col-md-6">
                     <select name="manager_name" id="manager_name">
					 </select>
                 	 </div>
						</div>
						</td>
                        <td>별 점</td>
						<td>
						<div id="star" style="cursor: pointer; width: 200px;">
							<img src="../lib/images/star/star-on.png" alt="1" title="bad">&nbsp;
							<img src="../lib/images/star/star-on.png" alt="2" title="poor">&nbsp;
							<img src="../lib/images/star/star-on.png" alt="3" title="regular">&nbsp;
							<img src="../lib/images/star/star-on.png" alt="4" title="good">&nbsp;
							<img src="../lib/images/star/star-on.png" alt="5" title="gorgeous">
							<br/>
							<input type="radio" id="grade" name="grade" value="1">&nbsp;&nbsp;
							<input type="radio" id="grade" name="grade" value="2">&nbsp;&nbsp;
							<input type="radio" id="grade" name="grade" value="3">&nbsp;&nbsp;
							<input type="radio" id="grade" name="grade" value="4">&nbsp;&nbsp;
							<input type="radio" id="grade" name="grade" value="5">
						</div>
						</td>
						<td><br><br></td>
                     </tr>
                     <tr>
                     </tr>
                     <tr>
                        <td>내용</td>
                        <td id="editorTd"></td>
                     </tr>
                     <tr>
                        <td colspan="2"><input type="button" id="save" value="저장"/>
                           <input type="reset" class="btn btn-danger" value="취소" /></td>
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
   <script src="../lib/ajax.js"></script>
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