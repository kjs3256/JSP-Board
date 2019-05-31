<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.*" %>
<%@ page import="comment.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	int pageSize = 10; //한페이지에 보여지는 게시글 수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) pageNum="1";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize+1;
	int endRow = currentPage * pageSize;
	//추가한 코드
	int count = 0;
	int comm_count = 0;
	int number = 0;
	List<BbsDto> articleList = null;
	BbsDao dbPro = BbsDao.getInstance();
	count = dbPro.getArticleCount(); //전체 글 수
	if(count > 0){
		articleList = dbPro.getArticles(startRow, endRow);
	}
	number = count - (currentPage-1) * pageSize;
	CommentDao cDao = CommentDao.getInstance();
	comm_count = 0;
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
		<a class="navbar-brand" href="main.jsp">진수's World!</a>
	</div>
	<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="survey.jsp">설문조사</a></li>
			<li><a href="bbs.jsp">게시판(전체 글수 : <%=count %>)</a></li>
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
<!-- 게시판 -->
<div class="container">
	<div class="row">
	<%
		if(count == 0){
	%>
		<table class="table table-striped">
			<tr>
			<td><h3 class="text-center">게시판에 저장된 글이 없습니다.</h3></td>
			</tr>
		</table>
	<%}else{%>
		<table class="table table-striped text-center" style="border:1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color:#eeeeee; text-align:center;">번호</th>
					<th style="background-color:#eeeeee; text-align:center;">제목</th>
					<th style="background-color:#eeeeee; text-align:center;">작성자</th>
					<th style="background-color:#eeeeee; text-align:center;">작성일</th>
					<th style="background-color:#eeeeee; text-align:center;">조회수</th>
					<th style="background-color:#eeeeee; text-align:center;">IP</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<articleList.size(); i++){
						BbsDto article = (BbsDto)articleList.get(i);
						comm_count= cDao.getCommentCount(article.getNum());
				%>
					<tr>
						<td> <%= number-- %></td>
						<td class="titled">
						<%
						int wid = 0;
						if(article.getDepth() > 0){
							wid = 5 * (article.getDepth());
						%>
						<img src = "images/level.gif" width="<%=wid %>">
						<img src = "images/re.gif">
						<%}else{ %>
						<img src = "images/level.gif" width="<%=wid %>">
						<%} %>
						<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage%>">
							<%= article.getSubject().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></a>
							[<%= comm_count %>]
							<% if(article.getReadcount() >= 20){ %>
							<img src="images/hot.gif"><%} %></td>
						<td>
							<%= article.getNickname() %>
						</td>
						<td>
							<%= sdf.format(article.getRegdate()) %></td>
						<td><%= article.getReadcount() %></td>
						<td><%= article.getIp() %></td>
					</tr>
			<% } %>
			</tbody>
		</table>
		<%} %>
		<%
			if(count > 0){
				int pageBlock = 5;
				int imsi = count % pageSize == 0 ? 0 : 1;
				int pageCount = count / pageSize + imsi;
				int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
				int endPage = startPage + pageBlock - 1;
				if(endPage > pageCount) endPage = pageCount;
				%>
				<div class = "text-center">
				<ul class="pagination">
				<%
				if(startPage > pageBlock){%>
					<li><a href="bbs.jsp?pageNum=<%=startPage-pageBlock %>">이전</a></li>
		<%
				}
				for(int i=startPage; i<=endPage; i++){
		%>
					<li><a href="bbs.jsp?pageNum=<%=i %>" class="text text-center"><%=i%></a></li>
		<%
				}
				if(endPage < pageCount){
		%>
					<li><a href="bbs.jsp?pageNum=<%=startPage+pageBlock %>">다음</a></li>
		<%
				}
		%>
				</ul>
				</div>
		<%
		}
		%>
		<a class="btn btn-primary pull-right" href="writeForm.jsp">글쓰기</a>
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