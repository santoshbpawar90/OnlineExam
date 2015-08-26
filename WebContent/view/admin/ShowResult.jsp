<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Result</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<%@include file="QPackMain.jsp" %>
</head>
<body>

<%
int id=0;
if(request.getParameter("path")!=null)
{
	id=Integer.parseInt(request.getParameter("path"));
}




StudentLoginDao loginDao=new StudentLoginDao();
StudentLogin login=loginDao.getStudentLoginById(id);


%>

<br><br><br>
<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading"><b>Result</b></div>
  <div class="panel-body">
  
  <div class="row">`
		
			<div class="col-md-3" align="right"><b style="font-size: medium;">Student: </b><b style="color: purple;"><%if(login!=null && login.getStudName()!=null){				
				out.print(login.getStudName());
			} %></b></div>
				<div class="col-md-3" align="right"><b style="font-size: medium;">Exam: </b><b style="color: purple;"><%if(login!=null && login.getPack()!=null){				
				out.print(login.getPack().getqPackName());
			} %></b></div>
			<div class="col-md-3" align="right"><b style="font-size: medium;">Subject: </b><b style="color: purple;"><%if(login!=null && login.getPack()!=null){				
				out.print(login.getPack().getSubName());
			} %></b></div>
	  			
		</div>
  
  <br><br>
  <div class="row">	
	  <div class="col-md-1" align="right">
	  </div>
	  <div class="col-md-10" align="right">
	  
	  	
	  	<table class="table table-bordered table-hover">
			<tr class="info">
				<td align="center"><b>Question No</b></td>
				
				<td align="center"><b>Answer</b></td>
				
				
			</tr>

<%


if(login!=null && login.getResPath()!=null && !login.getResPath().trim().equals(""))
	{
		
	
	File file=new File(login.getResPath());
	
	if(file!=null && file.exists())
		{
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(file);
			
			doc.getDocumentElement().normalize();
			System.out.println("Root element :"
					+ doc.getDocumentElement().getNodeName());
		
			NodeList nList = doc.getElementsByTagName("questionAnswer");
			
			if(nList!=null)
			for (int temp = 0; temp < nList.getLength(); temp++) {
		
				Node nNode = nList.item(temp);
		
				System.out.println("\nCurrent Element :" + nNode.getNodeName());
		
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
		
					Element eElement = (Element) nNode;
		
					%>
					<tr class="info">
				<td align="center"><b><%=temp+1 %></b></td>
				<%-- <td align="center"><b><%out.print(eElement.getElementsByTagName("questionId").item(0).getTextContent()); %></b></td> --%>
				<td align="center"><b><%out.print(eElement.getElementsByTagName("anwser").item(0).getTextContent()); %></b></td>
				
				
			</tr>
					<%
					
					
		
				}
		}
	}
}
%>
</table>
</div>
</div>

</div>
</div>

</body>
</html>