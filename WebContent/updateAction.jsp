<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.*" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "article" scope="page" class="bbs.BbsDto">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");
	BbsDao dbProc = BbsDao.getInstance();
	int check = dbProc.updateArticle(article);
	if(check == 1){
%>

	<meta http-equiv="Refresh" content="0;url=bbs.jsp?pageNum=<%= pageNum%>">
<%
	}
%>