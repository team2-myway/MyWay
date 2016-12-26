<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("account_no");
	session.removeAttribute("id");
	session.invalidate();
%>
<script>
location.href="../main/index.jsp";
</script>