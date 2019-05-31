<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.*" %>
<%@ page import = "survey.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	SurveyDao dao = SurveyDao.getInstance();
	SurveyDto sDto = dao.surveyResult(num);
	UserDao uDao = UserDao.getInstance();
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
	<%
		String loginID = null;
			if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
			}
			UserDto uDto = uDao.getUser(loginID);
			if(loginID == null){
	%>
		<script>
			alert("로그인을 해주세요!!");
			location.href = "loginForm.jsp";
		</script>
	<%
		}
	%>
	<header>
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
				<a class="navbar-brand" href="main.jsp">진수's World!</a>
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
	</header>
	<div class="container">
		<div class="row" style="padding:20px; margin-left:20px; clear:both;">
			<p><h1 class="text text-primary">스포츠 선호도 설문조사</h1>
			<p><h2><small>- 결과 -</small></h2>
			<hr/>
			<div class="jumbotron">
				<div>
					<h3>닉네임 : <%=uDto.getNickname() %></h3>
					<h3><small>나이 : <%=uDto.getAge() %>세</small></h3>
					<h3><small>성별 : <%=uDto.getGender() %></small></h3>
					<h3><small>거주지 : <%=uDto.getLoc() %></small></h3>
				</div>
				<hr/>
				<div class="text-center">
					<h3 class="text-primary">좋아하는 스포츠</h3>
					<h4 style="color:black;"><%=sDto.getSports() %></h4>
				</div>
				<hr/>
				<div class="text-center">
					<h3 class="text-success">좋아하는 팀</h3>
					<h4 style="color:black;"><%=sDto.getFav_team() %></h4>
				</div>
				<hr/>
				<div class="text-center">
					<h3 class="text-success">좋아하는 선수</h3>
					<h4 style="color:black;"><%=sDto.getFav_player() %></h4>
				</div>
				<hr/>
				<div class="text-center">
					<h3 class="text-danger">싫어하는 팀</h3>
					<h4 style="color:black;"><%=sDto.getHate_team() %></h4>
				</div>
				<hr/>
				<div class="text-center">
					<h3 class="text-danger">싫어하는 선수</h3>
					<h4 style="color:black;"><%=sDto.getHate_player() %></h4>
				</div>
				<hr/>
				<a href="surveyStatistics.jsp" class="btn btn-lg btn-success col-sm-6">전체 통계</a>
				<a href="main.jsp" class="btn btn-lg btn-primary col-sm-6">메인</a>
			</div>
		</div>
	</div>
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