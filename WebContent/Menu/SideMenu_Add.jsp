<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="Menu.dao.MenuDao"></jsp:useBean>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<div class="col-md-12">
			  	<p>
			<b style="color: green"> Myway 사이드 메뉴 등록</b>
		</p>
		<form id="Menu_Saves" onsubmit="return false;" method="post" action="SideMenu_Add_proc.jsp" enctype="multipart/form-data">
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<td class="heading" valign="top" align="right" nowrap>메뉴 이름</td>
				<td valign="top" align=left><input type="text" id="side_menu_name" name="side_menu_name"
					size="80" /></td>
			</tr>
			<tr>
				<td>메뉴 카테고리</td>	
				<td>
					<select name="category" id="category">
						<option value="drink" selected>drink</option>
						<option value="dessert">dessert</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>이미지 파일</td>
				<td valign="top" align=left>
					<input type="file" name="image" />
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>칼로리</td>
				<td valign="top" align=left>
					<input type="text" name="calorie" id="calorie"/>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>가격</td>
				<td valign="top" align=left>
					<input type="text" name="price" id="price"/>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>상세내용</td>
				<td valign="top" align=left>
					<textarea name="detail"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<button class="btn btn-primary" id="Menu_Save">저장</button>
				<input type="reset" value="취소" /></td>
			</tr>
		</table>
		</form>
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
		$("#Menu_Save").click(function(){
			SelSauce();
		});
	});
		function SelSauce() {
			var chk = document.getElementsByName("sauce_no[]");
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
				checkCnt++;        //체크된 체크박스의 개수
				checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 

			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
						if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						}else{
							rowid += checkRow+"|";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
			}
				$("#SelectSauceValue").val(rowid);
				CheckValue();
		}
		function CheckValue(){
			var menu_name = $("#menu_name").val();
			var menu_class = $("#menu_class").val();
			var calorie = $("#calorie").val();
			var price = $("#price").val();
			
			
			if(menu_name == ""){
				alert("메뉴이름을 써주세요");
				return;
			}
			if(menu_class == ""){
				alert("메뉴카테고리를  골라주세요");
				return;
			}
			if(calorie == ""){
				alert("칼로리를 입력해주세요.");
				return;
			}
			if(price == ""){
				alert("메뉴가격을 입력해주세요");
				return;
			}
		
			MenuSave();	
			
		}
		function MenuSave(){
			document.getElementById("Menu_Saves").submit();
		}

		
	</script>
	


</body>
</html>