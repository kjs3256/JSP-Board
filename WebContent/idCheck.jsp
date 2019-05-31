<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%
	UserDao dao = UserDao.getInstance();
	String id = request.getParameter("id");
	boolean check = dao.idCheck(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복체크</title>
<script src="script.js"></script>
<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
	a{ text-decoration: none; }
</style>
</head>
<body>
	<div class="text-center">
		<br><b><%= id %></b>
		<%
			if(check){ out.println("는 이미 존재하는 ID입니다.<br/><br/>"); }
			else{	out.println("는 사용 가능한 ID입니다.<br/><br/>"); }
		%>
		<a href="#" onClick="javascript:self.close()">닫기</a>
	</div>
</body>
</html>