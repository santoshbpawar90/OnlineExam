<%@page import="manipal.onlineexam.util.SPConstants"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="manipal.onlineexam.student.dao.QPackDao"%>
<%@page import="manipal.onlineexam.student.entity.QPack"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@ page language="java" session="false"%>

<%@page import="manipal.onlineexam.listener.SessionCounterListener"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Exam System-Local Server Management</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<%@include file="QPackMain.jsp" %>
</head>
<body>
<% 


int seconds=60;
if(SPConstants.getInstance().getSpProperty("refresh.time")!=null)
{
	try
	{
	seconds=Integer.parseInt(SPConstants.getInstance().getSpProperty("refresh.time"));
	}
	catch(NumberFormatException exception)
	{
		exception.printStackTrace();
		seconds=60;
	}
}

response.setIntHeader("Refresh", seconds);



QPackDao qPackDao=new QPackDao();
List<QPack> packs=qPackDao.getAllQPacks();
QPack pack=null;
if(packs!=null)
{
	for(QPack qPack:packs)
	{
		pack=qPack;
	}
}

%>
<br><br><br>
	
	
	<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading" style="background-image: url('../../images/header-background-admin.jpg');"><b style="font-size: medium;">System Monitor</b></div>
  <div class="panel-body"  >
   
   <div class="form-group">
	<div class="row">`
		
			<div class="col-md-2" align="right"><b style="font-size: medium;">Exam: </b><b style="color: purple;"><%if(pack!=null && pack.getqPackName()!=null){				
				out.print(pack.getqPackName());
			} %></b></div>
				<div class="col-md-3" align="right"><b style="font-size: medium;">Subject: </b><b style="color: purple;"><%if(pack!=null && pack.getSubName()!=null){				
				out.print(pack.getSubName());
			} %></b></div>
			<div class="col-md-3" align="right"><b style="font-size: medium;">Test Date: </b><b style="color: purple;"><%if(pack!=null && pack.getDate()!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				out.print(sdf.format(pack.getDate()));
			} %></b></div>
	  		
	  			<div class="col-md-3" align="right"><b style="font-size: medium;">Test Time: </b><b style="color: purple;"><%if(pack!=null && pack.getDate()!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
				out.print(sdf.format(pack.getDate()));
					} %></b>
	  			</div>
	  			
		</div>
	</div>
   
	

	<% 
	StudentLoginDao loginDao=new StudentLoginDao();
	List<StudentLogin> studentLogins=loginDao.getAllStudentLogins();
	int count=0;
	int loginCount=0;
	int present=0;
	if(studentLogins!=null)
	{
		count=studentLogins.size();
		for(StudentLogin studentLogin: studentLogins)
		{
			if(studentLogin.getLoginStatus().equals("1") )
			{
				loginCount++;
			}
			if(studentLogin.getLoginStatus().equals("1") ||  studentLogin.getLoginStatus().equals("2"))
			{
				present++;
			}
		}	
	}
	
	
	%>
	<br><br><br><br>
	<div class="form-group">
	<div class="row">	
	<div class="col-md-4" align="right"></div>
	  <div class="col-md-4" align="right">
	  	<div class="table-responsive">
	  	<table class="table table-bordered table-hover">
			<tr class="info">
				<td width="350" style="font-size: medium;"><b>No of Students Expected</b></td>
				<td align="center" style="font-size: medium;"><b style="color: purple;"><%= count %></b></td>
			</tr>
			
			<tr class="active">
				<td style="font-size: medium;"><b>No of Students Present</b></td>
				<td align="center" style="font-size: medium;"><b style="color: purple;"> <%= present %></b> </td>
			</tr>
			
			<tr class="info">
				<td style="font-size: medium;"><b>No of Students Absent</b></td>
				<td align="center" style="font-size: medium;"><b style="color: purple;"><%=count-present %></b></td>
			</tr>
			
			<tr class="active">
				<td style="font-size: medium;"><b>No of Students Active</b></td>
				<td align="center" style="font-size: medium;"><b style="color: purple;"><%=loginCount %></b></td>
			</tr>
			<!-- <tr class="">
				<td>Active Systems</td>
			 	<td></td>
			</tr>
			
			<tr class="info">
				<td>Idle Systems</td>
				<td></td>
			</tr>
			<tr class="">
				<td>First Test Started Time:</td>
				<td></td>
			</tr>
			
			<tr class="info">
				<td>Everyone Ended Test Time</td>
				<td></td>
			</tr> -->
		</table>
		</div>
		<br><br>
	  	<div class="col-md-3" align="right"></div>
	  </div>
	  
	 </div>
	 <div class="row">	
	  <div class="col-md-12" align="center">
	  	<a href="SystemMonitor.jsp"><input type="button" value="Refresh" style="font-weight: bolder;" class="btn btn-primary" ></a>
	  	<a href="SystemMonitorStudDetails.jsp"><input type="button" value="Show Details" style="font-weight: bolder;" class="btn btn-primary" ></a>
	  	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	  </div>
	  
	 </div>
	 
	</div>

</div></div>
</body>
</html>