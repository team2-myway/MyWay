<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<p><b style="color:green"> Myway 메뉴 등록</b></p>
<table border="1" cellspacing="0" cellpadding="10">
<tr><td class="heading" valign="top" align="right" nowrap>메뉴 이름</td>
<td valign="top" align=left>
<input type="text" name="name" size="80" /> 
</td></tr>
<td> 메뉴 카테고리 </td>
			<td>
				<select name="s_addr">
					<option value="프리미엄">프리미엄</option>
					<option value="베스트">베스트</option>
					<option value="클래식">클래식</option>
				
				</select>
<tr><td class="heading" valign="top" align="right" nowrap>ㅇㅇㅇ</td><td valign="top" align=left>
<input type="text" name="name" size="80" /> <br />
</td></tr>
<tr><td class="heading" valign="top" align="right" nowrap>이미지 파일</td><td valign="top" align=left>
<input type=file name=nfo size=80> <br>
			</td>
	<tr>
			<td colspan="2" align="center">
				<input type="submit" value="추가"/>&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소" />
			</td>
		</tr>			
			
</table>
</body>
</html>