<%@page import="manipal.onlineexam.admin.dao.TrailDao"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="java.util.Date"%>
<%@page import="manipal.onlineexam.admin.entity.Trail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int uId=0;

if(request.getParameter("uId")!=null && !request.getParameter("uId").trim().equalsIgnoreCase(""))
{
	uId=Integer.parseInt(request.getParameter("uId"));
}

StudentLoginDao loginDao=new StudentLoginDao();
StudentLogin login=loginDao.getStudentLoginById(uId);  

Trail trail=new Trail();
trail.setMyEvent("End Exam");
trail.setMyDate(new Date());
trail.setStudentLogin(login);

TrailDao dao=new TrailDao();
dao.addTrail(trail);
session.invalidate();
response.sendRedirect("LoginStudent.jsp");

%>
</body>
</html>