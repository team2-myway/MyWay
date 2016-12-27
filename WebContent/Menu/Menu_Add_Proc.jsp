<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "dao" class="Menu.dao.MenuDao" />
<jsp:useBean id="dto" class="Menu.dto.MenuDto"/>
<%
	String path1 = request.getRealPath("/menu");
	String path = getServletContext().getRealPath("menu"); //가상경로(web상의 url 경로)를 넘기면 컴퓨터의 실제 물리적 경로로 알려준다.
	
	int maxSize = 50 * 1024 * 1024; //50바이트 * 1024 * 1024= 50메가바이트
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy()); //업로드 하게 하는 인스턴스
	Enumeration files = mr.getFileNames();
	String file1 = (String)files.nextElement();
	String filename1 = mr.getFilesystemName(file1);
	
	String fileFullPath = path + "\\" + filename1;
	
	String menu_name = mr.getParameter("menu_name");
	String menu_class = mr.getParameter("class");
	int calorie = Integer.parseInt(mr.getParameter("calorie"));
	int price = Integer.parseInt(mr.getParameter("price"));
	String recomsauce = mr.getParameter("SelectSauceValue");
	String size = mr.getParameter("menu_size");
	String detail = mr.getParameter("detail");
	
	dto.setM_name(menu_name);
	dto.setM_class(menu_class);
	dto.setM_calorie(calorie);
	dto.setM_price(price);
	dto.setM_img("/MyWay/Menu/"+filename1);
	dto.setM_recomsauce(recomsauce);
	dto.setM_size(size);
	dto.setM_detail(detail);
	
	dao.AddMenu(dto);
%>
<script>
	alert("insert okay");
	location.href="MenuIndex.jsp";
</script>
