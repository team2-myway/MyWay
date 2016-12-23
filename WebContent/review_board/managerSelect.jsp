<%@page import="myway.ReviewDto"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dto" class="myway.ReviewDto"></jsp:useBean>
<jsp:useBean id="dao" class="myway.ReviewDao"></jsp:useBean>
<option value="" width="200px;">매장선택</option>
<%
	String manager_area = request.getParameter("manager_area");
	String manager_name = request.getParameter("manager_name");
 	try {
   		List nameList = dao.getManagerName(manager_area);
   		for (int i = 0; i < nameList.size(); i++) {
   			dto = (ReviewDto)nameList.get(i);
%>
<option value="<%=dto.getManager_name()%>" <%=dto.getManager_name().equals(manager_name)?"selected":"" %>><%=dto.getManager_name()%></option>
<%
	}
	
	} catch (Exception err) {
	   System.out.println("managerSelect.jsp : " + err);
	}

%>
