<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.*" %>
<%
	UserDao dao = UserDao.getInstance();
%>  
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<%
	String id = (String)session.getAttribute("loginID");
	String pass = request.getParameter("pass");
	int check = dao.userDelete(id, pass);
	if(check == 1){
		session.invalidate();
%>
<meta http-equiv="Refresh" content="3;url=loginForm.jsp">
<body>
<div class="container">
	<div class="jumbotron" style="padding-top:30px;">
		<div class="text-center">
			<p>회원정보가 삭제되었습니다.<br></p>
			<p>3초 후에 로그인 페이지로 이동합니다.</p>
			<%
			}
			else{
			%>
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.go(-1);
			</script>
			<%} %>
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