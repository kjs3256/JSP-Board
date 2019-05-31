<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%
	UserDao dao = UserDao.getInstance(); 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="user.UserDto" scope="page" />
<jsp:setProperty name="dto" property="*"/>
<%
	boolean flag = dao.userInsert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리그오브레전드 대리</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	String loginID = null;
	if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
	}
	if(loginID != null){
	%>
	<script>
		alert("이미 로그인 되어있습니다.");
		location.href="main.jsp";
	</script>
	<%
	}
%>
	<br/><br/>
	<div class="container">
		<div class="row text-center" style="margin-top:40px;">
<%
	if(flag){
		out.println("<b>회원 가입을 축하드립니다.</b><br/>");
		out.println("드디어 설문조사를 할 수 있겠네요 ㅎㅅㅎ<br/>");
		out.println("<a href=loginForm.jsp>로그인</a>");
	}else{
		out.println("<b>ID중복체크를 해주세요. 중복 시 가입 불가</b><br/>");
		out.println("<a href=join.jsp>다시 가입</a>");
	}
%>
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