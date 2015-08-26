<%@page import="manipal.onlineexam.student.entity.QPack"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.dao.QPackDao"%>
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
QPackDao qPackDao=new QPackDao();
List<QPack> qPacks=qPackDao.getAllQPacks();
if(qPacks!=null)
for(QPack qPack:qPacks)
{
	qPack.setIntervalStatus("0");
	qPackDao.updateQPack(qPack);
}


%>
</body>
</html>