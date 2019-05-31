<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDao" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "article" scope="page" class="bbs.BbsDto">
<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	String loginID = null;
	if(session.getAttribute("loginID") != null){
		loginID = (String)session.getAttribute("loginID");
	}
	article.setRegdate(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	article.setId(loginID);
	BbsDao dbPro = BbsDao.getInstance();
	dbPro.insertArticle(loginID, article);
	response.sendRedirect("bbs.jsp");
%>