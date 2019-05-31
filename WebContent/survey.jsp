<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function checkBox() {
		var check_Box = document.getElementsByName("sports"); //체크박스 name
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
			<p><h2><small>( 각 항목 당 하나씩만 선택해주세요. )</small></h2>
			<hr/>
			<form method="post" name="myForm" action="surveyAction.jsp">
				<div class="form-group">
				<p><h3 class="text text-default">좋아하는 스포츠</h3>
					<div>
						<label class="radio-inline" for="baseball">야구</label>
						<input type="radio" id="baseball" name="sports" value="baseball" onClick="checkBox()">
						<label class="radio-inline" for="soccer">축구</label>
						<input type="radio" id="soccer" name="sports" value="soccer" onClick="checkBox()">
					</div>
					<hr/>
				</div>
				<div class="form-group">
					<div id="1" style="display:none;">
						<p><h4 class="text text-default">좋아하는 야구 팀</h4>
						<table class="table table-striped">
							<tr>
								<th>롯데 자이언츠</th>
								<th>NC 다이노스</th>
								<th>삼성 라이온즈</th>
								<th>KIA 타이거즈</th>
								<th>키움 히어로즈</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_team" value="롯데자이언츠"></td>
								<td><input type="radio" name="fav_team" value="NC다이노스"></td>
								<td><input type="radio" name="fav_team" value="삼성라이온즈"></td>
								<td><input type="radio" name="fav_team" value="KIA타이거즈"></td>
								<td><input type="radio" name="fav_team" value="키움히어로즈"></td>
							</tr>
							<tr>
								<th>SK 와이번스</th>
								<th>두산 베어스</th>
								<th>한화 이글스</th>
								<th>KT 위즈</th>
								<th>LG 트윈스</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_team" value="SK와이번스"></td>
								<td><input type="radio" name="fav_team" value="두산베어스"></td>
								<td><input type="radio" name="fav_team" value="한화이글스"></td>
								<td><input type="radio" name="fav_team" value="KT위즈"></td>
								<td><input type="radio" name="fav_team" value="LG트윈스"></td>
							</tr>
						</table>
						<hr/>
						<p><h4 class="text text-default">싫어하는 야구 팀</h4>
						<table class="table table-striped">
							<tr>
								<th>롯데 자이언츠</th>
								<th>NC 다이노스</th>
								<th>삼성 라이온즈</th>
								<th>KIA 타이거즈</th>
								<th>키움 히어로즈</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_team" value="롯데자이언츠"></td>
								<td><input type="radio" name="hate_team" value="NC다이노스"></td>
								<td><input type="radio" name="hate_team" value="삼성라이온즈"></td>
								<td><input type="radio" name="hate_team" value="KIA타이거즈"></td>
								<td><input type="radio" name="hate_team" value="키움히어로즈"></td>
							</tr>
							<tr>
								<th>SK 와이번스</th>
								<th>두산 베어스</th>
								<th>한화 이글스</th>
								<th>KT 위즈</th>
								<th>LG 트윈스</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_team" value="SK와이번스"></td>
								<td><input type="radio" name="hate_team" value="두산베어스"></td>
								<td><input type="radio" name="hate_team" value="한화이글스"></td>
								<td><input type="radio" name="hate_team" value="KT위즈"></td>
								<td><input type="radio" name="hate_team" value="LG트윈스"></td>
							</tr>
						</table>
						<hr/>
						<p><h4 class="text text-default">좋아하는 선수</h4>
						<table class="table table-striped">
							<tr>
								<th>이대호</th>
								<th>손아섭</th>
								<th>박해민</th>
								<th>구자욱</th>
								<th>박병호</th>
								<th>서건창</th>
								<th>김광현</th>
								<th>양현종</th>
								<th>로맥</th>
								<th>버나디나</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_player" value="이대호"></td>
								<td><input type="radio" name="fav_player" value="손아섭"></td>
								<td><input type="radio" name="fav_player" value="박해민"></td>
								<td><input type="radio" name="fav_player" value="구자욱"></td>
								<td><input type="radio" name="fav_player" value="박병호"></td>
								<td><input type="radio" name="fav_player" value="서건창"></td>
								<td><input type="radio" name="fav_player" value="김광현"></td>
								<td><input type="radio" name="fav_player" value="양현종"></td>
								<td><input type="radio" name="fav_player" value="로맥"></td>
								<td><input type="radio" name="fav_player" value="버나디나"></td>
							</tr>
							<tr>
								<th>황재균</th>
								<th>주권</th>
								<th>김태균</th>
								<th>하주석</th>
								<th>오지환</th>
								<th>윌슨</th>
								<th>김재환</th>
								<th>린드블럼</th>
								<th>나성범</th>
								<th>배탄코트</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_player" value="황재균"></td>
								<td><input type="radio" name="fav_player" value="주권"></td>
								<td><input type="radio" name="fav_player" value="김태균"></td>
								<td><input type="radio" name="fav_player" value="하주석"></td>
								<td><input type="radio" name="fav_player" value="오지환"></td>
								<td><input type="radio" name="fav_player" value="윌슨"></td>
								<td><input type="radio" name="fav_player" value="김재환"></td>
								<td><input type="radio" name="fav_player" value="린드블럼"></td>
								<td><input type="radio" name="fav_player" value="나성범"></td>
								<td><input type="radio" name="fav_player" value="배탄코트"></td>
							</tr>
						</table>
						<hr/>
						<p><h4 class="text text-default">싫어하는 선수</h4>
						<table class="table table-striped">
							<tr>
								<th>이대호</th>
								<th>손아섭</th>
								<th>박해민</th>
								<th>구자욱</th>
								<th>박병호</th>
								<th>서건창</th>
								<th>김광현</th>
								<th>양현종</th>
								<th>로맥</th>
								<th>버나디나</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_player" value="이대호"></td>
								<td><input type="radio" name="hate_player" value="손아섭"></td>
								<td><input type="radio" name="hate_player" value="박해민"></td>
								<td><input type="radio" name="hate_player" value="구자욱"></td>
								<td><input type="radio" name="hate_player" value="박병호"></td>
								<td><input type="radio" name="hate_player" value="서건창"></td>
								<td><input type="radio" name="hate_player" value="김광현"></td>
								<td><input type="radio" name="hate_player" value="양현종"></td>
								<td><input type="radio" name="hate_player" value="로맥"></td>
								<td><input type="radio" name="hate_player" value="버나디나"></td>
							</tr>
							<tr>
								<th>황재균</th>
								<th>주권</th>
								<th>김태균</th>
								<th>하주석</th>
								<th>오지환</th>
								<th>윌슨</th>
								<th>김재환</th>
								<th>린드블럼</th>
								<th>나성범</th>
								<th>배탄코트</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_player" value="황재균"></td>
								<td><input type="radio" name="hate_player" value="주권"></td>
								<td><input type="radio" name="hate_player" value="김태균"></td>
								<td><input type="radio" name="hate_player" value="하주석"></td>
								<td><input type="radio" name="hate_player" value="오지환"></td>
								<td><input type="radio" name="hate_player" value="윌슨"></td>
								<td><input type="radio" name="hate_player" value="김재환"></td>
								<td><input type="radio" name="hate_player" value="린드블럼"></td>
								<td><input type="radio" name="hate_player" value="나성범"></td>
								<td><input type="radio" name="hate_player" value="배탄코트"></td>
							</tr>
						</table>
						<hr/>
					</div>
					<div id="2" style="display:none;">
						<p><h4 class="text text-default">좋아하는 축구 팀</h4>
						<table class="table table-striped">
							<tr>
								<th>토트넘 홋스퍼FC</th>
								<th>리버풀FC</th>
								<th>맨체스터 유나이티드</th>
								<th>아스날</th>
								<th>맨체스터 시티</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_team" value="토트넘"></td>
								<td><input type="radio" name="fav_team" value="리버풀"></td>
								<td><input type="radio" name="fav_team" value="맨유"></td>
								<td><input type="radio" name="fav_team" value="아스날"></td>
								<td><input type="radio" name="fav_team" value="맨시티"></td>
							</tr>
							<tr>
								<th>FC 바르셀로나</th>
								<th>레알 마드리드</th>
								<th>유벤투스</th>
								<th>바이에른 뮌헨</th>
								<th>FC 샬케04</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_team" value="바르셀로나"></td>
								<td><input type="radio" name="fav_team" value="레알마드리드"></td>
								<td><input type="radio" name="fav_team" value="유벤투스"></td>
								<td><input type="radio" name="fav_team" value="바이에른뮌헨"></td>
								<td><input type="radio" name="fav_team" value="샬케"></td>
							</tr>
						</table>
						<hr/>
						<p><h4 class="text text-default">싫어하는 축구 팀</h4>
						<table class="table table-striped">
							<tr>
								<th>토트넘 홋스퍼FC</th>
								<th>리버풀FC</th>
								<th>맨체스터 유나이티드</th>
								<th>아스날</th>
								<th>맨체스터 시티</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_team" value="토트넘"></td>
								<td><input type="radio" name="hate_team" value="리버풀"></td>
								<td><input type="radio" name="hate_team" value="맨유"></td>
								<td><input type="radio" name="hate_team" value="아스날"></td>
								<td><input type="radio" name="hate_team" value="맨시티"></td>
							</tr>
							<tr>
								<th>FC 바르셀로나</th>
								<th>레알 마드리드</th>
								<th>유벤투스</th>
								<th>바이에른 뮌헨</th>
								<th>FC 샬케04</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_team" value="바르셀로나"></td>
								<td><input type="radio" name="hate_team" value="레알마드리드"></td>
								<td><input type="radio" name="hate_team" value="유벤투스"></td>
								<td><input type="radio" name="hate_team" value="바이에른뮌헨"></td>
								<td><input type="radio" name="hate_team" value="샬케"></td>
							</tr>
						</table>
						<hr/>
						<p><h4 class="text text-default">좋아하는 선수</h4>
						<table class="table table-striped">
							<tr>
								<th>손흥민</th>
								<th>살라</th>
								<th>갓날두</th>
								<th>메좆</th>
								<th>요렌테</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_player" value="손흥민"></td>
								<td><input type="radio" name="fav_player" value="살라"></td>
								<td><input type="radio" name="fav_player" value="호날두"></td>
								<td><input type="radio" name="fav_player" value="메시"></td>
								<td><input type="radio" name="fav_player" value="요렌테"></td>
							</tr>
							<tr>
								<th>헤리케인</th>
								<th>아게로</th>
								<th>로벤</th>
								<th>레반도프스키</th>
								<th>외질</th>
							</tr>
							<tr>
								<td><input type="radio" name="fav_player" value="헤리케인"></td>
								<td><input type="radio" name="fav_player" value="아게로"></td>
								<td><input type="radio" name="fav_player" value="로벤"></td>
								<td><input type="radio" name="fav_player" value="레반도프스키"></td>
								<td><input type="radio" name="fav_player" value="외질"></td>
							</tr>
						</table>
						<hr/>
						<p><h4 class="text text-default">싫어하는 선수</h4>
						<table class="table table-striped">
							<tr>
								<th>손흥민</th>
								<th>살라</th>
								<th>갓날두</th>
								<th>메좆</th>
								<th>요렌테</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_player" value="손흥민"></td>
								<td><input type="radio" name="hate_player" value="살라"></td>
								<td><input type="radio" name="hate_player" value="호날두"></td>
								<td><input type="radio" name="hate_player" value="메시"></td>
								<td><input type="radio" name="hate_player" value="요렌테"></td>
							</tr>
							<tr>
								<th>헤리케인</th>
								<th>아게로</th>
								<th>로벤</th>
								<th>레반도프스키</th>
								<th>외질</th>
							</tr>
							<tr>
								<td><input type="radio" name="hate_player" value="헤리케인"></td>
								<td><input type="radio" name="hate_player" value="아게로"></td>
								<td><input type="radio" name="hate_player" value="로벤"></td>
								<td><input type="radio" name="hate_player" value="레반도프스키"></td>
								<td><input type="radio" name="hate_player" value="외질"></td>
							</tr>
						</table>
						<hr/>
					</div>
				</div>
				<input type="submit" class="btn btn-primary" value="완료">
				<input type="reset" class="btn btn-danger" value="다시">
				<a href="surveyStatistics.jsp" class="btn btn-lg btn-success">전체 통계</a>
				<a href="main.jsp" class="btn btn-default pull-right">메인</a>
			</form>
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