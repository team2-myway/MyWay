<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
		<select name="store_no">
						
				
<%
	String manager_addr = request.getParameter("manager_addr");
 try {
	ArrayList managerList = dao.ManagerList(manager_addr);
	for (int i = 0; i < managerList.size(); i++) {
		OrderDto dto = (OrderDto) managerList.get(i);
%>
	<option value="<%=dto.getManage_no()%>"><%=dto.getManage_name()%></option>
<%
 }

} catch (Exception err) {
	System.out.println("menuSelectClass.jsp : " + err);
}

%>
</select>


	





