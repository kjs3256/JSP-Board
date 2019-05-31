<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDao" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="userDto" class="user.UserDto" scope="page" />
<jsp:setProperty name = "userDto" property="*"/>

<%
	UserDao uDao = UserDao.getInstance(); //인스턴스 생성
	String id = userDto.getId();
	String pass = userDto.getPass();
	int result = uDao.login(id, pass);
	//로그인 성공
	if(result == 1){
		session.setAttribute("loginID", userDto.getId());
		//아이디 저장을 체크했을 경우
		if(request.getParameter("saveID") != null){
			Cookie cookie = new Cookie("saveID", (String)session.getAttribute("loginID"));
			cookie.setPath("/");
			cookie.setMaxAge(60*30);
			response.addCookie(cookie);
		}
		//체크하지 않을 경우
		else{
			Cookie cookie = new Cookie("saveID","");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		response.sendRedirect("main.jsp");
	}
	//로그인 실패
	else if(result == 0){
%>
<script>
	alert("비밀번호가 틀렸습니다.");
	history.back();
</script>
<%
	}
	//아이디 없음
	else{
	
%>
<script>
	alert("존재하지 않는 아이디 입니다.");
	history.back();
</script>
<%
	}
%>