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
			  	<p>
			<b style="color: green"> Myway �޴� ���</b>
		</p>
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<td class="heading" valign="top" align="right" nowrap>�޴� �̸�</td>
				<td valign="top" align=left><input type="text" name="name"
					size="80" /></td>
			</tr>
			<tr>
				<td>�޴� ī�װ�</td>
				<td>
					<select name="class">
						<option value="�����̾�">�����̾�</option>a
						<option value="����Ʈ">����Ʈ</option>
						<option value="Ŭ����">Ŭ����</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>������</td>
				<td valign="top" align=left>
					<input type="radio" name="menu_size" value="15" checked/> 15cm&nbsp;&nbsp;&nbsp;
					<input type="radio" name="menu_size" value="30"/> 30cm&nbsp;&nbsp;&nbsp;
				 </td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>�̹��� ����</td>
				<td valign="top" align=left>
					<input type="file" name="image" />
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>Į�θ�</td>
				<td valign="top" align=left>
					<input type="text" name="calorie"/>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>����</td>
				<td valign="top" align=left>
					<input type="text" name="price"/>
				</td>
			</tr>
			<tr>
				<td class="heading" valign="top" align="right" nowrap>��õ�ҽ�</td>
				<td valign="top" align=left>
					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="�߰�" />&nbsp;&nbsp;&nbsp;
					<input type="reset" value="���" /></td>
			</tr>

		</table>
			  	
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


</body>
</html>