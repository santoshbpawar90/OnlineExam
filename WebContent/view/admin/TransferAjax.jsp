<%@page import="manipal.onlineexam.admin.dao.Transfer"%>
<%@page import="manipal.onlineexam.admin.dao.TrailDao"%>
<%@page import="manipal.onlineexam.admin.entity.Trail"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="org.w3c.dom.Attr"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.transform.TransformerException"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.net.Socket"%>
<%@page import="java.net.ServerSocket"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
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

Transfer transfer=new  Transfer();
boolean res= transfer.sendFile();
if(res)
{
	out.print("Send Successfully.");
}
else
{
	out.print("Send Unsuccessfully.");
}


%>

</body>
</html>