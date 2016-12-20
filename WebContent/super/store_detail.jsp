<%@page import="management.StoreDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="../lib/js/jquery-3.1.1.min.js"></script>
<script>
</script>
</head>
<body class="page">
<jsp:useBean id="dao" class="management.StoreDao"></jsp:useBean>
<jsp:useBean id="dto" class="management.StoreDto"></jsp:useBean>
<%
	String account_no = request.getParameter("account_no");
	String detail_date = request.getParameter("date");
	
	if(request.getParameter("date1") != null && request.getParameter("date2") != null && !request.getParameter("date1").isEmpty() && !request.getParameter("date2").isEmpty()) {
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		detail_date = date1 + "-" + date2;
	} else {
		detail_date = request.getParameter("date");
		if(detail_date == null) {
			detail_date = "total";
		}
	}
	
	List list = dao.getStore_list(account_no);
	List listdetail = dao.getStore_detail(account_no, detail_date);
	StoreDto totdto = dao.getStore_total(account_no, detail_date);
	
	///////////////////////////paging ���///////////////////////////
		int totalRecord = 0; //��ü ���� ����
		int numPerPage = 5; //���������� ���� ����
		int pagePerBlock = 3; //�� �� �� ������ ��
		int totalPage = 0; //��ü ������ ��
		int totalBlock = 0; //��ü ����� ��
		int nowPage = 0; //���� ������ ��ȣ
		int nowBlock = 0; //���� �� ��ȣ
		int beginPerPage = 0; //�������� ���۹�ȣ

		totalRecord = list.size();
		totalPage = (int) Math.ceil(((double) totalRecord / numPerPage));
		totalBlock = (int) Math.ceil(((double) totalPage / pagePerBlock));

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		if (request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		}

		beginPerPage = nowPage * numPerPage;

%>
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%>
		<div class="container">
			<!-- �������� -->
			<div class="col-sm-12" id="store_info" align="center">
				<table width=100% border=0 cellspacing=0cellpadding=3>
					<tr align=center bgcolor=#D0D0D0 height=120%>
						<td width="200px" align="center">������</td>
						<td width="200px" align="center">��������</td>
						<td width="200px" align="center">�����</td>
						<td width="200px" align="center">�����ȣ</td>
					</tr>
<%
			try{ 
				request.setCharacterEncoding("euc-kr");
				for(int i = 0; i < list.size(); i++) {
					dto = (StoreDto)list.get(i);
%>
					<tr align="center">
						<td><%=dto.getAccount_name() %></td>
						<td><%=dto.getManager_area() %></td>
						<td><%=dto.getManager_name() %></td>
						<td><%=dto.getTel() %></td>
					</tr>
<%
				}
			} catch(Exception e) {
				System.out.println("store_detail.jsp : " + e);
			}
%>
					<tr>
						<td><BR> <BR></td>
					</tr>
				</table>
			</div>
			
			<!-- ��ư -->
			<div class="col-sm-12"  id="detail_button" align="center">
				<input type="button" id="today" value="���ø���" onclick="location.href='store_detail.jsp?account_no=<%=account_no%>&date=today'"/>
				<input type="button" id="month" value="�̹��޸���" onclick="location.href='store_detail.jsp?account_no=<%=account_no%>&date=month'"/>
				<input type="button" id="total" value="��ü����" onclick="location.href='store_detail.jsp?account_no=<%=account_no%>&date=total'"/>
				<form name="dateform" method="post" action="store_detail.jsp?account_no=<%=account_no%>">
				<input type="text" name="date1" /> - <input type="text" name="date2" /> 
				<input type="submit" id="search" value="�˻�"/>
				</form>
			</div>
			<!-- ����  -->
			<div class="col-sm-12" id="store_total" align="right">
				�� ���� : <%=totdto.getTotal()%><br/>
			</div>
			<!-- ����Ʈ -->
			<div class="col-sm-12" id="store_list" align="center">
				<table width=100% border=0 cellspacing=0cellpadding=3>
					<tr align=center bgcolor=#D0D0D0 height=120%>
						<td width="200px" align="center">no</td>
						<td width="200px" align="center">��¥</td>
						<td width="200px" align="center">�ֹ�����</td>
						<td width="200px" align="center">�����ݾ�</td>
						<td width="200px" align="center">��������</td>
					</tr>
<%
					if(listdetail.isEmpty()) {
%>
					<tr align="center">
						<td>��ϵ� �����Ͱ� �����ϴ�!</td>
					</tr>
<%
		} else {
			try{ 
				request.setCharacterEncoding("euc-kr");
			
					for(int i = 0; i < listdetail.size(); i++) {
						dto = (StoreDto)listdetail.get(i);
%>
						<tr align="center">
							<td><%=dto.getOrder_no() %></td>
							<td><%=dto.getDate() %></td>
							<td>�ֹ�����</td>
							<td><%=dto.getTotal() %></td>
							<td><%=dto.getStatus() %></td>
						</tr>
<%
					}
			} catch(Exception e) {
				System.out.println("store_detail.jsp : " + e);
			}
		}
%>
					<tr>
						<td><BR> <BR></td>
					</tr>
					<tr>
						<td align="left">Go to Page &nbsp;&nbsp;&nbsp;&nbsp; <%
 						if (nowBlock > 0) {
 %> 
 						<a href="store_detail.jsp?nowPage=<%=(nowBlock - 1) * pagePerBlock%>&nowBlock=<%=(nowBlock - 1)%>">���� <%=pagePerBlock%>��
						</a>:::&nbsp;&nbsp;&nbsp; 
<%
 						}
 %> 
 <%
 						for (int i = 0; i < pagePerBlock; i++) {
 							if ((nowBlock * pagePerBlock) + i == totalPage)
 								break;
 %> 
 							<a href="store_detail.jsp?nowPage=<%=i + (nowBlock * pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i + 1 + (nowBlock * pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
<%
						}
						if (totalBlock > nowBlock + 1) {
%>
							&nbsp;&nbsp;&nbsp;:::<a href="List.jsp?nowPage=<%=(nowBlock + 1) * pagePerBlock%>&nowBlock=<%=(nowBlock + 1)%>">����
							<%=pagePerBlock%>�� </a> 
<%
 						}
%>
						</td>
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