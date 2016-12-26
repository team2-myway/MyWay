<%@page import="account.AccountDao"%>
<%@page import="account.AccountDto"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="head.jsp"%>
<%
	AccountDto headerdto = new AccountDto();
	AccountDao headerdao = new AccountDao();
	Object session_id = session.getAttribute("id");
	//System.out.println(session_id);
%>
<div class="header">
	<div class="header_inner">
		<div class="custom_header">
			<div class="header_html">
<%
				if(session_id == null) {
%>
				<span class="contact_widget_phone"><a href="../Login_HW/login.jsp">로그인</a> <span></span> </span>					
				<span class="contact_widget_email"> <span></span> <a href="../Login_HW/join.jsp">회원가입</a></span>
<%
				} else {
%>
				<span class="contact_widget_phone"><a href="../Login_HW/logout.jsp">로그아웃</a> <span></span> </span>
<%	
				}
%>
			</div>
		</div>
<%
		headerdto = headerdao.session(session.getAttribute("id"));
		if(headerdto.getLevel() == null || headerdto.getLevel().isEmpty() || headerdto.getLevel().equals("null") || headerdto.getLevel().equals("customer")){
%>
		<div class="col-sm-12">
			<div class="col-sm-3">
				<a href="index.html" title="Medicure" class="logo"> <img
					src="images/logo-jpeg.jpg" alt="Medicure"></a> <a
					class="responsive_nav" href="javascript:void(0);"> <span></span></a>
			</div>
			<div class="col-sm-9">
				<div class="wrap_nav">
					<nav role="navigation">
						<ul id="navigation" class="navigation">
							<li class="menu-item current_page_item"><a
								href="../main/index.jsp"><span>메인</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>주문</span></a>
								<ul class="sub-menu">
									<li class="dropdown menu-item menu-item-has-children"><a><span>클래식</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>프리미엄</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>베스트</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>사이드메뉴</span></a></li>
								</ul></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>문의사항</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a href="../review_board/review_List.jsp"><span>후기</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
<%
		}
		else if(headerdto.getLevel().equals("super")){
%>
		<div class="col-sm-12">
			<div class="col-sm-3">
				<a href="index.html" title="Medicure" class="logo"> <img
					src="images/logo-jpeg.jpg" alt="Medicure"></a> <a
					class="responsive_nav" href="javascript:void(0);"> <span></span></a>
			</div>
			<div class="col-sm-9">
				<div class="wrap_nav">
					<nav role="navigation">
						<ul id="navigation" class="navigation">
							<li class="menu-item current_page_item"><a
								href="../main/index.jsp"><span>메인</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>메뉴등록</span></a>
								<ul class="sub-menu">
									<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/Menu_Add.jsp"><span>메인메뉴등록</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/SideMenu_Add.jsp"><span>사이드메뉴등록</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/MenuIndex.jsp"><span>메인메뉴</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/SideMenuIndex.jsp"><span>사이드메뉴</span></a></li>
									
								</ul></li>
							<li class="menu-item"><a href="../super/store_list.jsp"><span>전체매장보기</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>문의사항</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a href="../review_board/review_List.jsp"><span>후기</span></a></li>
							
						</ul>
					</nav>
				</div>
			</div>
		</div>
<%
		}
		else if(headerdto.getLevel().equals("manager")){
%>
		<div class="col-sm-12">
			<div class="col-sm-3">
				<a href="index.html" title="Medicure" class="logo"> <img
					src="images/logo-jpeg.jpg" alt="Medicure"></a> <a
					class="responsive_nav" href="javascript:void(0);"> <span></span></a>
			</div>
			<div class="col-sm-9">
				<div class="wrap_nav">
					<nav role="navigation">
						<ul id="navigation" class="navigation">
							<li class="menu-item current_page_item"><a
								href="../main/index.jsp"><span>메인</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>메뉴등록</span></a>
								<ul class="sub-menu">
									<li class="dropdown menu-item menu-item-has-children"><a><span>클래식</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>프리미엄</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>베스트</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>사이드메뉴</span></a></li>
								</ul></li>
							<li class="menu-item"><a href="./manager/store_detail.jsp"><span>매장현황</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>문의사항</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a href="./review_board/review_List.jsp"><span>후기</span></a></li>
							
						</ul>
					</nav>
				</div>
			</div>
		</div>
<%
		}
%>
	</div>
</div>