<%@page import="management.StoreDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body class="page">
	<jsp:useBean id="dao" class="management.StoreDao"></jsp:useBean>
	<jsp:useBean id="dto" class="management.StoreDto"></jsp:useBean>
	<%
		List list = dao.getStore_list("accountno");

		///////////////////////////paging 기법///////////////////////////
		int totalRecord = 0; //전체 글의 갯수
		int numPerPage = 5; //한페이지당 글의 개수
		int pagePerBlock = 3; //한 블럭 당 페이지 수
		int totalPage = 0; //전체 페이지 수
		int totalBlock = 0; //전체 블록의 수
		int nowPage = 0; //현재 페이지 번호
		int nowBlock = 0; //현재 블럭 번호
		int beginPerPage = 0; //페이지당 시작번호

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
			<!-- 리스트 -->
			<div id="store_list" align="center">
				<table width=100% border=0 cellspacing=0 cellpadding=3>
					<tr align=center bgcolor=#D0D0D0 height=120%>
						<td width="200px" align="center">관리자명</td>
						<td width="200px" align="center">매장명</td>
						<td width="200px" align="center">매출보기</td>
					</tr>
					<%
						if (list.isEmpty()) {
					%>
					<tr align="center">
						<td>등록된 데이터가 없습니다!</td>
					</tr>
					<%
						} else {
							try {
								request.setCharacterEncoding("euc-kr");

								for (int i = 0; i < list.size(); i++) {
									dto = (StoreDto) list.get(i);
					%>
					<tr align="center">
						<td><%=dto.getAccount_name()%></td>
						<td><%=dto.getManager_name()%></td>
						<td><a
							href="store_detail.jsp?account_no=<%=dto.getAccount_no()%>">상세보기</a></td>
					</tr>
					<%
						}
							} catch (Exception e) {
								System.out.println("store_List.jsp : " + e);
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
 						<a href="store_list.jsp?nowPage=<%=(nowBlock - 1) * pagePerBlock%>&nowBlock=<%=(nowBlock - 1)%>">이전 <%=pagePerBlock%>개
						</a>:::&nbsp;&nbsp;&nbsp; 
<%
 						}
 %> 
 <%
 						for (int i = 0; i < pagePerBlock; i++) {
 							if ((nowBlock * pagePerBlock) + i == totalPage)
 								break;
 %> 
 							<a href="store_list.jsp?nowPage=<%=i + (nowBlock * pagePerBlock)%>&nowBlock=<%=nowBlock%>"><%=i + 1 + (nowBlock * pagePerBlock)%></a>&nbsp;&nbsp;&nbsp;
<%
						}
						if (totalBlock > nowBlock + 1) {
%>
							&nbsp;&nbsp;&nbsp;:::<a href="List.jsp?nowPage=<%=(nowBlock + 1) * pagePerBlock%>&nowBlock=<%=(nowBlock + 1)%>">다음
							<%=pagePerBlock%>개 </a> 
<%
 						}
%>
						</td>
					</tr>
				</table>
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
</body>
</html>