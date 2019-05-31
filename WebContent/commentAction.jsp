<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.*"%>
<%@ page import="user.*"%>
<%@ page import="java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="comment.CommentDto">
<jsp:setProperty name="dto" property="comment_content" />
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String loginID = null;
	if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
	}
	UserDao uDao = UserDao.getInstance();
	UserDto uDto = uDao.getUser(loginID);
	if(loginID != null){
		CommentDao dbPro = CommentDao.getInstance();
		dto.setComment_nickname(uDto.getNickname());
		dto.setComment_regdate(new Timestamp(System.currentTimeMillis()));
		dto.setComment_ip(request.getRemoteAddr());
		dto.setId(loginID);
		dto.setNum(num);
		dbPro.insertComment(dto);
		response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);
	}else{
%>
		<script>
			alert("로그인을 해주세요!!");
			history.go(-1);
		</script>
<%}%>