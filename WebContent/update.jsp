<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.*" %>
<%
	String loginID = null;
	if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
	}
	System.out.println("히히");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try{
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>글내용 수정</title>
</head>
<body>
	<%
		if(loginID == null){%>
		<script>
			alert("로그인을 해주세요오!!!!");
			location.href="loginForm.jsp";
		</script>
	<%}
		BbsDao dbPro = BbsDao.getInstance();
		BbsDto article = dbPro.updateGetArticle(num);
		if(!loginID.equals(article.getId())){
	%>
		<script>
			alert("권한이 없습니다.");
			location.href="bbs.jsp";
		</script>
	<%	}%>
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
				aria-expanded="false">관리<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="logoutForm.jsp">로그아웃</a></li>
				<li><a href="deleteUser.jsp">회원탈퇴</a></li>
			</ul>
			</li>
		</ul>
	</div>
</nav>
<!-- 수정 -->
<div class="container">
	<div class="row">
		<form method="post" name="writeForm" action="updateAction.jsp?num=<%=num %>&pageNum=<%=pageNum%>"
		onsubmit="return writeSave()">
			<input type="hidden" name="nickname" value="<%=article.getNickname() %>" />
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center"><h3>글 수정</h3></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control col-sm-4" placeholder="변경할 글 제목" name="subject" maxlength="50" value="<%=article.getSubject() %>"/></td>
					</tr>
					<tr>
						<td><textarea class="form-control" name="content" maxlength="2048" style= "resize:none; height:350px;"><%= article.getContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<button type="submit" class="btn btn-primary pull-right">글수정</button>
		</form>
	</div>
</div>
<%
	}catch(Exception e){}
%>
<footer>
		<h5 class="text-center text-default">Copyright ⓒ. kj3256@naver.com</h5>
</footer>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS -->
<script src="js/bootstrap.js"></script>
<!-- JS -->
<script src="js/script.js"></script>
</body>
</html>