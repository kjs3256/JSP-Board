<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
	a{ text-decoration: none;}
</style>
</head>
<body>
<div class="container">
	<div class="row text-center" style="margin-top:40px;">
		<b>로그아웃이 되었습니다. 바위~</b><br/><br/>
		<a href="loginForm.jsp" class="text text-center">로그인 페이지로 이동</a>
	</div>
</div>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS -->
<script src="js/bootstrap.js"></script>
<!-- JS -->
<script src="js/script.js"></script>
</body>
</html>