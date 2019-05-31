<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="survey.SurveyDto">
<jsp:setProperty name="dto" property="*" />
</jsp:useBean>
<%	
	SurveyDao dao = SurveyDao.getInstance();
	dao.insertSurvey(dto);
	int num = dao.getNum();
	response.sendRedirect("surveyResult.jsp?num="+num);
%>