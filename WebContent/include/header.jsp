<%@page import="account.AccountDao"%>
<%@page import="account.AccountDto"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="head.jsp"%>
<%
	AccountDto headerdto = new AccountDto();
	AccountDao headerdao = new AccountDao();
	headerdto = headerdao.session(session.getAttribute("id"));
	Object session_id = session.getAttribute("id");
%>
<div class="header">
	<div class="header_inner">
		<div class="col-md-12">
			<div class="col-md-3">
					<a href="../main/index.jsp" title="MyWay" > <img
					src="../lib/images/logo.PNG" alt="MyWay"></a> <a
					class="responsive_nav" href="javascript:void(0);"> <span></span></a>
			</div>
			<div class="col-md-9">
				<div class="custom_header2">
										
					<div class="header_html">
		<%
						if(session_id == null) {
		%>
						<span class="contact_widget_phone"><a href="../login/login.jsp">로그인</a> <span></span> </span>					
						<span class="contact_widget_email"> <span></span> <a href="../login/join.jsp">회원가입</a></span>
		<%
						} else if(headerdto.getLevel().equals("super")){
		%>
						<span class="contact_widget_phone"><a href="../login/logout.jsp">로그아웃</a> <span></span> </span>
						<span class="contact_widget_email"> <span></span> <a href="../login/manager_join.jsp">매니저가입</a></span>
		<%
						} else {
		%>
						<span class="contact_widget_phone"><a href="../login/logout.jsp">로그아웃</a> <span></span> </span>
		<%	
						}
		%>
					</div>
				</div>
			</div>
		</div>
<%
		if(headerdto.getLevel() == null || headerdto.getLevel().isEmpty() || headerdto.getLevel().equals("null") || headerdto.getLevel().equals("customer")){
%>
		
			<div class="wrap_nav">
				<div class="col-sm-12">
					<div class="col-sm-offset-2 col-sm-8">
						<nav role="navigation">
							<ul id="navigation" class="navigation">
								<li class="menu-item current_page_item"><a
									href="../main/index.jsp"><span>메인</span></a></li>
								<li class="dropdown menu-item menu-item-has-children"><a><span>메뉴보기</span></a>
									<ul class="sub-menu">
										<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/MenuIndex2.jsp"><span>메인메뉴</span></a></li>
										<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/SideMenuIndex2.jsp"><span>사이드메뉴</span></a></li>
									</ul>
								</li>
								<li class="dropdown menu-item menu-item-has-children"><a><span>주문하기</span></a>
									<ul class="sub-menu">
										<li class="dropdown menu-item menu-item-has-children"><a href="../order/order.jsp"><span>주문하기</span></a></li>
										<li class="dropdown menu-item menu-item-has-children"><a href="../order/OrderList.jsp"><span>주문내역보기</span></a></li>
									</ul>
								</li>
								<li class="dropdown menu-item menu-item-has-children"><a href="../inquiry_board/inquiry_List.jsp"><span>문의사항</span></a></li>
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
			<div class="wrap_nav">
				<div class="col-sm-12">
					<div class="col-sm-offset-2 col-sm-8">
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
									</ul>
								</li>
								<li class="menu-item"><a href="../super/store_list.jsp"><span>전체매장보기</span></a></li>
								<li class="dropdown menu-item menu-item-has-children"><a href="../inquiry_board/inquiry_List.jsp"><span>문의사항</span></a></li>
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
				<div class="wrap_nav">
					<div class="col-sm-12">
						<div class="col-sm-offset-2 col-sm-8">
							<nav role="navigation">
								<ul id="navigation" class="navigation">
									<li class="menu-item current_page_item"><a
										href="../main/index.jsp"><span>메인</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>메뉴보기</span></a>
										<ul class="sub-menu">
											<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/MenuIndex2.jsp"><span>메인메뉴</span></a></li>
											<li class="dropdown menu-item menu-item-has-children"><a href="../Menu/SideMenuIndex2.jsp"><span>사이드메뉴</span></a></li>
										</ul></li>
									<li class="menu-item"><a href="../manager/store_detail.jsp"><span>매장현황</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a href="../inquiry_board/inquiry_List.jsp"><span>문의사항</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a href="../review_board/review_List.jsp"><span>후기</span></a></li>
									
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