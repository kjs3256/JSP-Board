<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "comment.*" %>
<%
	String loginID = null;
	if(loginID == null){
		loginID = (String)session.getAttribute("loginID");
	}
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
%>
<%
		if(loginID == null){%>
		<script>
			alert("로그인을 해주세요오!!!!");
			location.href="loginForm.jsp";
		</script>
	<%}
		CommentDao dbPro = CommentDao.getInstance();
		int i = dbPro.deleteComment(comment_num);
		if(i == 1){%>
			<meta http-equiv="Refresh" content="0;url=content.jsp?num=<%=num %>&pageNum=<%= pageNum%>">
		<%
		}%>