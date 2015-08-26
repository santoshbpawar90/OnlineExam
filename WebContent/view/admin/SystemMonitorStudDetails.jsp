<%@page import="java.text.SimpleDateFormat"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Details</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<%@include file="QPackMain.jsp" %>
</head>
<body>

<br><br><br>
<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading"><b>Student Details</b></div>
  <div class="panel-body">
  <br>
   <div class="row">	
	  <div class="col-md-12" align="right">
	  	<a href="SystemMonitorStudDetails.jsp"><input type="button" value="Refresh" style="font-weight: bolder;"	 class="btn btn-primary" ></a>
	  	
	  </div>
	  
	 </div>
   
   
<div class="row">	
	  <div class="col-md-1" align="right">
	  </div>
	  <div class="col-md-10" align="right">
	  
	  	
	  	<table class="table table-bordered table-hover">
			<tr class="info">
				<td align="center"><b>Sr. No</b></td>
				<td align="center"><b>Student Id</b></td>
				<td align="center"><b>Login Id</b></td>
				<td align="center"><b>Student</b></td>
				<td align="center"><b>College</b></td>
				<td align="center"><b>Login Date & Time</b></td>
				<td align="center"><b>Login Status</b></td>
				<td align="center"><b>Result</b></td>
				
			</tr>
			
			<%
			
			StudentLoginDao loginDao=new StudentLoginDao();
			List<StudentLogin> studentLogins=loginDao.getAllStudentLogins();
			int count=0;
			
			if(studentLogins!=null)
			{
				
				for(StudentLogin studentLogin: studentLogins)
				{
						%>
						<tr>
						<td align="center"><%=++count %></td>
						<td align="center"><%=studentLogin.getStudId() %></td>
						<td align="center"><%=studentLogin.getUserName() %></td>
						<td align="center"><%=studentLogin.getStudName() %></td>
						<td align="center"><%=studentLogin.getCollege() %></td>
						<td align="center">
						<%if(studentLogin!=null && studentLogin.getLoginTime()!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy,HH:mm:ss");
				out.print(sdf.format(studentLogin.getLoginTime()));
					} %>
						</td>
						<td align="center"><%if(studentLogin.getLoginStatus()!=null && studentLogin.getLoginStatus().equals("1") ){out.print("Logged In.");}else if(studentLogin.getLoginStatus()!=null && studentLogin.getLoginStatus().equals("2") ){out.print("Logged Out.");}else{out.print("Not Logged In.");}  %></td>
						<td align="center"> <a href=ShowResult.jsp?path=<%=studentLogin.getId()%>>Show</a> </td>						
						</tr>
						<%	
					
				}	
			}
			
				
			
			%>
		</table>
		<div class="col-md-1" align="right">
		</div>
	</div>
	</div>
</div></div>
</body>
</html>