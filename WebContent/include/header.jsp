<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="head.jsp"%>

<div class="header">
	<div class="header_inner">
		<div class="custom_header">
			<div class="header_html">
				<span class="contact_widget_phone"><a>�α���</a> <span></span> </span>
				<span class="contact_widget_email"> <span></span> <a
					href="mailto:info@medicuredemo.web">ȸ������</a></span>
			</div>
		</div>

<%
		//if (session.getAttribute("super").equals("super")){
%>
		<div class="col-sm-12">
			<div class="col-sm-3">
				<a href="index.html" title="Medicure" class="logo"> <img
					src="images/logo-jpeg.jpg" alt="Medicure"></a> <a
					class="responsive_nav" href="javascript:void(0);"> <span></span></a>
			</div>
			<div class="col-sm-9">
				<!-- _________________________ Start Navigation _________________________ -->
				<div class="wrap_nav">
					<nav role="navigation">
						<ul id="navigation" class="navigation">
							<li class="menu-item current_page_item"><a
								href="../main/index.jsp"><span>����</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>�޴����</span></a>
								<ul class="sub-menu">
									<li class="dropdown menu-item menu-item-has-children"><a><span>Ŭ����</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>�����̾�</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>����Ʈ</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>���̵�޴�</span></a></li>
								</ul></li>
							<li class="menu-item"><a href="/MyWay/super/store_list.jsp"><span>������Ȳ</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>���ǻ���</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>�ı�</span></a></li>
						</ul>
					</nav>
				</div>
				<!-- _________________________ Finish Navigation _________________________ -->
			</div>
		</div>
<%
		//} else if (session.getAttribute("manager").equals("manager")) {
%>
<!-- 
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
								href="../main/index.jsp"><span>����</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>�޴�</span></a>
								<ul class="sub-menu">
									<li class="dropdown menu-item menu-item-has-children"><a><span>Ŭ����</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>�����̾�</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>����Ʈ</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>���̵�޴�</span></a></li>
								</ul></li>
							<li class="menu-item"><a href="/MyWay/manager/store_detail.jsp"><span>������Ȳ</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>���ǻ���</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>�ı�</span></a></li>
							
						</ul>
					</nav>
				</div>
				
			</div>
		</div>
		 -->
<%
		//} else {
%>
<!-- 
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
								href="../main/index.jsp"><span>����</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>�޴�</span></a>
								<ul class="sub-menu">
									<li class="dropdown menu-item menu-item-has-children"><a><span>Ŭ����</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>�����̾�</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>����Ʈ</span></a></li>
									<li class="dropdown menu-item menu-item-has-children"><a><span>���̵�޴�</span></a></li>
								</ul></li>
							<li class="menu-item"><a href="#"><span>�ֹ�</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>���ǻ���</span></a></li>
							<li class="dropdown menu-item menu-item-has-children"><a><span>�ı�</span></a></li>
							<li class="menu-item"><a href="#"><span>����������</span></a></li>
						</ul>
					</nav>
				</div>
				
			</div>
		</div>
<%
		//}
%>
 -->
	</div>
</div>