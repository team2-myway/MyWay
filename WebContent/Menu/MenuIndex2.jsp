<%@page import="Menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="Menu.dto.MenuDto" />
<jsp:useBean id="dao" class="Menu.dao.MenuDao" />
<%
	List menulist = dao.MenuList();
%>
<body class="page">
	<section id="page" class="csstransition cmsms_resp hfeed site">
		<%@ include file="../include/header.jsp"%><br><br>
		
		
		<br><br>
		
		<div class="container">
			<div class="col-md-12">
		
<%
	for(int i=0; i<menulist.size(); i++){
			dto = (MenuDto)menulist.get(i);
%>
	<div class="col-md-4" style=" height:450px; text-align:center; ">
		<article class="service type-service hentry one_fourth format-slider col-md-12">
			<figure>
				<span class="image_container_img">
					<span class="p_img_container">
						<img src="<%=dto.getM_img() %>" 
								alt="Pediatric Clinic" class="fullwidth wp-post-image cmsms_img"
								style="opacity: 1;">
						<a href="Menu_Detail.jsp?menu_no=<%=dto.getM_no()%>"><%=dto.getM_name() %></a>
						
						<span class="image_rollover"></span>
					</span>
				</span>
			</figure>
			<div class="service_rollover" style="text-align:center;">
				<header class="entry-header" style="padding-bottom:10px;">
					<h5 class="entry-title" style="color:blue">
					</h5>
				</header>
				
				<footer class="entry-meta">
					<span class="post_category">가격 :<td><%=dto.getM_price() %> <b></b>원<br>
					
					</span>
				<div style="text-align:center">
					<p></p>
				</div>
				</footer>
			</div>
		</article>
	</div>
<%
							 }
%>

			</div>
		</div>
	
	</section>
		
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