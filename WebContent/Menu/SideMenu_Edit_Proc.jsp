<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "dao" class="Menu.dao.SideMenuDao" />
<jsp:useBean id="dto" class="Menu.dto.SideMenuDto"/>
<%
	String path1 = request.getRealPath("/menu");
	System.out.println(path1);
	String path = getServletContext().getRealPath("/menu"); //가상경로(web상의 url 경로)를 넘기면 컴퓨터의 실제 물리적 경로로 알려준다.
	
	int maxSize = 50 * 1024 * 1024; //50바이트 * 1024 * 1024= 50메가바이트
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy()); //업로드 하게 하는 인스턴스
	String fileName = mr.getFilesystemName("image");
	String fileFullPath = path + "\\" + fileName;
	
	int side_menu_no = Integer.parseInt(mr.getParameter("menu_no"));
	String side_menu_name = mr.getParameter("side_menu_name");
	String category = mr.getParameter("category");
	int calorie = Integer.parseInt(mr.getParameter("calorie"));
	int price = Integer.parseInt(mr.getParameter("price"));
	String detail = mr.getParameter("detail");
	
	dto.setM_no(side_menu_no);
	dto.setM_name(side_menu_name);
	dto.setM_category(category);
	dto.setM_calorie(calorie);
	dto.setM_price(price);
	dto.setM_img(fileFullPath);
	dto.setM_detail(detail);
	
	dao.UpdateSideMenu(dto);
%>
<script>
	alert("수정 완료");
	location.href="SideMenuIndex.jsp";
</script>
