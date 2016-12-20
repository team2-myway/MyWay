<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<label style="padding-right:10px;">추천소스 : </label><span><b style="color:aqua;"> 
<%
	String menu_no = request.getParameter("menu_no");
					
try {
	ArrayList bestlist = dao.BestSauce(menu_no);
		for(int i=0; i<bestlist.size(); i++){
			
%>	
			<%=bestlist.get(i)%> &nbsp;&nbsp;		
<%
		}

} catch (Exception err) {
	System.out.println("menuSelectClass.jsp : " + err);
}

%>
</b></span>
				
