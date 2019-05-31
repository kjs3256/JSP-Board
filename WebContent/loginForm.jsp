<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
	Cookie tmp = null;
	boolean check = false;
	if(request.getCookies() != null){
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
			tmp = cookieMap.get("saveID");
			if(tmp != null){
				check = true;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Jinsu's World!</title>
</head>
<body>
<!-- 네비게이션 -->
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle-collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expaned="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>	
		</button>
		<a class="navbar-brand" href="main.jsp">진수's World</a>
	</div>
	<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="survey.jsp">설문조사</a></li>
			<li><a href="bbs.jsp">게시판</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li class="active"><a href="loginForm.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			</li>
		</ul>
	</div>
</nav>
<!-- 로그인 폼 -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
	<!-- 점보트론 -->
		<div class="jumbotron" style="padding-top:20px;">
		<!-- 로그인 정보를 숨기면서 전송post -->
		<form method="post" action="loginAction.jsp">
		<h3 style="text-align:center;">로그인 화면</h3>
		<div class="form-group">
			<%
			if(check){
			%>
			<input type="text" class="form-control" placeholder="아이디" name="id" value=<%=tmp.getValue() %> maxlength="20">
			<%}else{ %>
			<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">
			<%} %>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" placeholder="비밀번호" name="pass" maxlength="20">
		</div>
		<div class="form-group">
			<%if(check){ %>
			<input type="checkbox" name="saveID" value="saveID" checked="checked">아이디 저장
			<%}else{ %>
			<input type="checkbox" name="saveID" value="saveID">아이디 저장
			<%} %>
		</div>
		<input type="submit" class="btn btn-primary form-control" value="로그인">
		</form>
		</div>
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