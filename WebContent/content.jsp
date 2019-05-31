<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.*" %>
<%@ page import="java.util.*" %>
<%@ page import="comment.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	String loginID = null;
	if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
	}
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	try{
		BbsDao dbPro = BbsDao.getInstance();
		BbsDto article = dbPro.getArticle(num);
		int count = 0;
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		CommentDao cDao = CommentDao.getInstance();
		List<CommentDto> commList = null;
		count = cDao.getCommentCount(num);
		if(count > 0){
			commList = cDao.getComments(num);
		}
		int comment_num = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title><%= article.getSubject() %></title>
<script>
function confirmDelete(num, pageNum){
	var msg = confirm("정말 삭제하시겠습니까?");
	if(msg == true){
		alert("삭제되었습니다.");
		location.href="deleteBBS.jsp?num="+num+"&pageNum="+pageNum;
	}
}
function commentDelete(num, pageNum, comment_num){
	var msg = confirm("정말 삭제하시겠습니까?");
	if(msg == true){
		alert("삭제되었습니다.");
		location.href="deleteComment.jsp?num="+num+"&pageNum="+pageNum+"&comment_num="+comment_num;
	}
}
</script>
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
		<%	} else{%>
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
		<%
			}
		%>
	</div>
</nav>
<!-- 글내용 -->
<div class="container">
	<div class="row">
		<h3><%=article.getSubject() %></h3>
		<h4><small><%=article.getNickname() %> | <%=sdf.format(article.getRegdate()) %> | 조회 : <%=article.getReadcount() %></small></h4>
		<hr/>
		<div class=container>
			<div class = "row" style="height:350px">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%= article.getContent() %></td>
					</tr>
				</table>
			</div>
		</div>
		<div class=container>
			<form id="commentForm" name="commentForm" method="post" action="commentAction.jsp">
				<input type="hidden" name="num" value=<%=num %>>
				<input type="hidden" name="pageNum" value="<%=pageNum %>">
				<div>
					<div>
						<span><strong>Comments(댓글 개수: <%=count %>)</strong></span><span id="cCnt"></span>
						<%if(count == 0){ %>
						<div class="text-center">
							<h3>아직 댓글이 없습니다.</h3>
						<%}else{ %>
						<div>
							<!-- 닉네임, 작성일, 댓글 내용, ip -->
							<table class="table">
							<%for(int i=0; i<commList.size(); i++){%>
								<tr>
									<th style="width:150px; background-color:#dddddd"><%=commList.get(i).getComment_nickname() %>&nbsp;&nbsp;|&nbsp;&nbsp; <%=sdf.format(commList.get(i).getComment_regdate()) %> &nbsp;&nbsp;<br><small><%=commList.get(i).getComment_ip() %></small></th>
									
									<td class="text-left"><%=commList.get(i).getComment_content() %></td>
									<%
										//본인일때만 삭제 가능
										if((loginID != null && loginID.equals(commList.get(i).getId()))){
											comment_num = commList.get(i).getComment_num();
									%>
											<td><input type="button" class="btn btn-sm btn-danger pull-right" 
												onClick="return commentDelete(<%=num %>,<%=pageNum %>,<%=comment_num %>)" value="댓글삭제"></td>
									<%
										} %>
								</tr>
							<%} %>
							</table>
						</div>
						<%}%>
						</div>
						<div>
							<table class="table">
								<tr>
									<%if(loginID != null){ %>
										<td colspan="3"><textarea name="comment_content" class="form-control" style= "resize:none; height:100px;" placeholder="댓글을 입력하세요"></textarea></td>
									<%}else{ %>
										<td colspan="3"><textarea name="comment_content" class="form-control" style= "resize:none; height:100px;" placeholder="로그인을 해야 댓글을 쓸 수 있습니다." readonly></textarea></td>
									<%} %>
								</tr>
								<tr>
									<td colspan="3"><input type="button" class="btn btn-primary" value="댓글 달기" onClick="commentCheck()"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</form>
			
		</div>
		
		<form method="post" action=deleteBBS.jsp name=confirmForm>
			<a href="bbs.jsp" class="btn btn-default">목록</a>
			<%
				//본인일때만 수정, 삭제 가능
				if((loginID != null && loginID.equals(article.getId()))){
			%>
				<a href="update.jsp?num=<%=num %>&pageNum=<%=pageNum %>" class="btn btn-warning">수정</a>
				<input type="button" class="btn btn-danger" onClick="return confirmDelete(<%=num %>,<%=pageNum %>)" value="삭제">
			<%
				}%>
				<input type = "button" value="답글" class="btn btn-default pull-right"
								onClick="document.location.href=
									'writeForm.jsp?num=<%=num %>&ref=<%=ref %>&step=<%=step %>&depth=<%=depth %>'">
		</form>
		<%
		}catch(Exception e){e.printStackTrace();}
		%>
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