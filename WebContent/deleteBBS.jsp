<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.*" %>
<%
	String loginID = null;
	if(loginID == null){
		loginID = (String)session.getAttribute("loginID");
	}
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<%
		if(loginID == null){%>
		<script>
			alert("로그인을 해주세요오!!!!");
			location.href="loginForm.jsp";
		</script>
	<%}
		BbsDao dbPro = BbsDao.getInstance();
		BbsDto article = dbPro.getArticle(num);
		int i = dbPro.deleteArticle(num);
		if(i == 1){%>
			<meta http-equiv="Refresh" content="0;url=bbs.jsp?pageNum=1">
		<%
		}%>