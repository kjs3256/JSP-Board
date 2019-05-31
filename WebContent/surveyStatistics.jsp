<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "survey.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	SurveyDao dao = SurveyDao.getInstance();
	int allUser = dao.surveyGetAll();
	int baseball = dao.surveySportsGet("baseball");
	int soccer = dao.surveySportsGet("soccer");
	String[] bTeam = {"롯데자이언츠","삼성라이온즈","KIA타이거즈","LG트윈스","KT위즈","두산베어스"
			,"키움히어로즈","한화이글스","NC다이노스","SK와이번스"};
	String[] sTeam = {"토트넘","리버풀","맨유","아스날","맨시티"
			,"바르셀로나","레알마드리드","유벤투스","바이에른뮌헨","샬케"};
	
	String[] bPlayer = {"이대호","손아섭","박해민","구자욱","박병호","서건창","김광현","양현종","로맥"
			,"버나디나","황재균","주권","김태균","하주석","오지환","윌슨","김재환","린드블럼","나성범","배탄코트"};
	String[] sPlayer = {"손흥민","살라","호날두","메시","요렌테","헤리케인","아게로","로벤","레반도프스키","외질"};
	
	List<Integer> bFavPlayerCount = new ArrayList<Integer>();
	for(int i=0; i<bPlayer.length; i++){
		bFavPlayerCount.add(dao.surveyFavPlayerGet(bPlayer[i]));
	}
	List<Integer> sFavPlayerCount = new ArrayList<Integer>();
	for(int i=0; i<sPlayer.length; i++){
		sFavPlayerCount.add(dao.surveyFavPlayerGet(sPlayer[i]));
	}
	List<Integer> bHatePlayerCount = new ArrayList<Integer>();
	for(int i=0; i<bPlayer.length; i++){
		bHatePlayerCount.add(dao.surveyHatePlayerGet(bPlayer[i]));
	}
	List<Integer> sHatePlayerCount = new ArrayList<Integer>();
	for(int i=0; i<sPlayer.length; i++){
		sHatePlayerCount.add(dao.surveyHatePlayerGet(sPlayer[i]));
	}
	
	List<Integer> bFavTeamCount = new ArrayList<Integer>();
	for(int i=0; i<bTeam.length; i++){
		bFavTeamCount.add(dao.surveyFavTeamGet(bTeam[i]));
	}
	List<Integer> sFavTeamCount = new ArrayList<Integer>();
	for(int i=0; i<sTeam.length; i++){
		sFavTeamCount.add(dao.surveyFavTeamGet(sTeam[i]));
	}
	List<Integer> bHateTeamCount = new ArrayList<Integer>();
	for(int i=0; i<bTeam.length; i++){
		bHateTeamCount.add(dao.surveyHateTeamGet(bTeam[i]));
	}
	List<Integer> sHateTeamCount = new ArrayList<Integer>();
	for(int i=0; i<sTeam.length; i++){
		sHateTeamCount.add(dao.surveyHateTeamGet(sTeam[i]));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script> 
	function checkBox() {
		var check_Box = document.getElementsByName("check"); //체크박스 name
		for (i = 0; i < check_Box.length; i++) {
			 var disign = document.getElementById([i+1]); // 보여질내용
			 if(check_Box[i].checked == true ){
			  disign.style.display = "block";
			 }else{
			  check_Box[i].checked = false;
			  disign.style.display = "none";
			 }
		 }
	}
</script>
<title>Jinsu's World!</title>
</head>
<body>
	<%
		String loginID = null;
		if(session.getAttribute("loginID") != null){
			loginID = (String)session.getAttribute("loginID");
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
				<%
			//로그인이 안된 경우
			if(loginID == null){
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="loginForm.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			</li>
		</ul>
		<%} else{%>
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
				<%} %>
			</div>
		</nav>
	</header>
	<div class="container">
		<div class="row" style="padding:20px; margin-left:20px; clear:both;">
			<p><h1 class="text text-primary">스포츠 선호도 설문조사</h1>
			<p><h2><small>- 전체 설문조사 통계 -</small></h2>
			<hr/>
			<div class="jumbotron" style="padding:30px;">
				<h3>전체 참여자 수 : <%=allUser %>명</h3>
				<hr/>
				<p><b class="text-primary">좋아하는 스포츠</b>
				<div>
					<label class="checkbox-inline" for="baseball">야구 : <%=baseball %>명</label>
					<input type="checkbox" class="checkbox-inline" id="baseball" name="check" onClick="checkBox()">
					<label class="checkbox-inline" for="soccer">축구 : <%=soccer %>명</label>
					<input type="checkbox" class="checkbox-inline" id="soccer" name="check" onClick="checkBox()">
				</div>
				<div id="1" style="display:none;" class="col-sm-5">
				<hr/>
				<p><h3>ㅁ 좋아하는 팀(야구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<10; i++){
						if(bFavTeamCount.get(i) == Collections.max(bFavTeamCount)){
					%>
							<h3><strong style="color:blue">1위.&nbsp;</strong><%=bTeam[i]%> : <%=bFavTeamCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				<hr/>
				<p><h3>ㅁ 싫어하는 팀(야구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<10; i++){
						if(bHateTeamCount.get(i) == Collections.max(bHateTeamCount)){
					%>
							<h3><strong style="color:red">1위.&nbsp;</strong><%=bTeam[i]%> : <%=bHateTeamCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				<hr/>
				<p><h3>ㅁ 좋아하는 선수(야구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<20; i++){
						if(bFavPlayerCount.get(i) == Collections.max(bFavPlayerCount)){
					%>
							<h3><strong style="color:blue">1위.&nbsp;</strong><%=bPlayer[i]%> : <%=bFavPlayerCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				<hr/>
				<p><h3>ㅁ 싫어하는 선수(야구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<20; i++){
						if(bHatePlayerCount.get(i) == Collections.max(bHatePlayerCount)){
					%>
							<h3><strong style="color:red">1위.&nbsp;</strong><%=bPlayer[i]%> : <%=bHatePlayerCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				</div>
				<div id="2" style="display:none;" class="col-sm-5">
				<hr/>
				<p><h3>ㅇ 좋아하는 팀(축구) ㅇ</h3>
				<hr/>
					<%
					for(int i=0; i<10; i++){
						if(sFavTeamCount.get(i) == Collections.max(sFavTeamCount)){
					%>
							<h3><strong style="color:blue">1위.&nbsp;</strong><%=sTeam[i]%> : <%=sFavTeamCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				<hr/>
				<p><h3>ㅁ 싫어하는 팀(축구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<10; i++){
						if(sHateTeamCount.get(i) == Collections.max(sHateTeamCount)){
					%>
							<h3><strong style="color:red">1위.&nbsp;</strong><%=sTeam[i]%> : <%=sHateTeamCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				<hr/>
				<p><h3>ㅁ 좋아하는 선수(축구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<10; i++){
						if(sFavPlayerCount.get(i) == Collections.max(sFavPlayerCount)){
					%>
							<h3><strong style="color:blue">1위.&nbsp;</strong><%=sPlayer[i]%> : <%=sFavPlayerCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				<hr/>
				<p><h3>ㅁ 싫어하는 선수(축구) ㅁ</h3>
				<hr/>
					<%
					for(int i=0; i<10; i++){
						if(sHatePlayerCount.get(i) == Collections.max(sHatePlayerCount)){
					%>
							<h3><strong style="color:red">1위.&nbsp;</strong><%=sPlayer[i]%> : <%=sHatePlayerCount.get(i) %>명</h3><br>
					<%
						}
					}
					%>
				</div>
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