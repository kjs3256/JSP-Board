<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Jinsu's World!</title>
</head>
<%
	int num = 0;
	int ref = 1;
	int step = 0;
	int depth = 0;
	try{
		if(request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			step = Integer.parseInt(request.getParameter("step"));
			depth = Integer.parseInt(request.getParameter("depth"));
		}
%>
<body>
<%
	String loginID = null;
	if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
	}
	if(loginID == null){
%>
	<script>
		alert("로그인을 해주세요!!");
		location.href = "bbs.jsp?pageNum=1";
	</script>
<%
	}
%>
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
<div class="container">
	<div class="row">
		<form method="post" name="writeForm" action="writeAction.jsp" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%= num %>" />
			<input type="hidden" name="ref" value="<%= ref %>" />
			<input type="hidden" name="step" value="<%= step %>" />
			<input type="hidden" name="depth" value="<%= depth %>" />
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;"><h3>신청글 작성</h3></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<%
							if(request.getParameter("num")==null){
						%>
							<input type="text" class="form-control" placeholder="제목" name="subject" maxlength="50"/>
						<%	} else{ %>
							<input type="text" name="subject" class="form-control" placeholder="답변 제목" value="[답변]" />
						<%	} %>
						</td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="내용" name="content" maxlength="2048" style= "resize:none; height:350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-success pull-right" value="글쓰기"/>
			<input type="button" class="btn btn-default" value="목록" 
								onClick="window.location='bbs.jsp?pageNum=1'"/>
		</form>
	</div>
</div>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
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