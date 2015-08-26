<%@page import="java.util.Date"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="java.time.Period"%>
<%@page import="manipal.onlineexam.admin.entity.TimeInterval"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.admin.dao.TimeIntervalDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.min.js"></script>
<%@include file="QPackMain.jsp" %>
</head>
<body>

<%

int id=0;
if(request.getParameter("id")!=null)
{
	id=Integer.parseInt(request.getParameter("id"));
}

StudentLoginDao studentLoginDao=new StudentLoginDao();
StudentLogin studentLogin=studentLoginDao.getStudentLoginById(id);
%>

<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading"><b>Student Details</b></div>
  <div class="panel-body">
  <br>
  
  <div class="row">	
	  <div class="col-md-1" align="right">
	
	  </div>
	  <div class="col-md-3" align="right">
	    <b>Name:</b><b style="color: purple;"><%=studentLogin.getStudName() %></b>
	  </div>
	   <div class="col-md-3" align="right">
	    <b>IP Address:</b><b style="color: purple;"><%=studentLogin.getIpAdd() %></b>
	  </div>
</div>
	  
  <br>
  <div class="row">	
	  <div class="col-md-1" align="right">
	  </div>
	  <div class="col-md-10" align="right">
	  
	  	
	  	<table class="table table-bordered table-hover">
			<tr class="info">
				<td align="center"><b>Sr. No</b></td>				
				<td align="center"><b>Date & Time</b></td>				
				<td align="center"><b>Status</b></td>				
			</tr>
			
			<%
			
			 
			TimeIntervalDao timeIntervalDao=new TimeIntervalDao();
			List<TimeInterval> intervals=timeIntervalDao.getAllTimeIntervalsByStudId(id);
			int sr=0;
			String chkStatus="-1";
			Date prevDate=null;
			if(intervals!=null)
			{
				for(TimeInterval interval:intervals)
				{
					if(interval.getActiveStatus()!=null && !chkStatus.equals(interval.getActiveStatus()))
					{
						
					
					%>
					<tr>
					<td align="center"><b><%=++sr %></b></td>				
					<td align="center"><b><%=interval.getDate() %><%-- ,<%=interval.getDate().getTime() %> --%></b></td>
				
					<td align="center">
					<%
					if(interval.getActiveStatus()!=null && interval.getActiveStatus().equals("1") ){
				    	out.println("<b style='color: green;'>Active</b>" );
				    }else{
				    	out.println("<b style='color: red;'>Inactive</b>" );
				    	
				    } 
					
					%>
					</td>
					<td align="center"><b><%
					if(prevDate!=null && interval.getDate()!=null)
					{
						
					
						long diff = prevDate.getTime() - interval.getDate().getTime();
	
						long diffSeconds = diff / 1000 % 60;
						long diffMinutes = diff / (60 * 1000) % 60;
						long diffHours = diff / (60 * 60 * 1000) % 24;
						long diffDays = diff / (24 * 60 * 60 * 1000);
	
						out.print(diffDays + " days, ");
						out.print(diffHours + " hours, ");
						out.print(diffMinutes + " minutes, ");
						out.print(diffSeconds + " seconds.");
					}
					 %></b></td>
				</tr>
					<%
					chkStatus=interval.getActiveStatus();
					prevDate=interval.getDate();
					}
				}
				
				%>
				
				<tr>
					<td align="center"><b></b></td>				
					<td align="center"><b></b></td>
				
					<td align="center">
					
					</td>
					<td align="center"><b><%
					if(prevDate!=null && intervals.get(intervals.size()-1).getDate()!=null)
					{
						
					
						long diff = prevDate.getTime() - intervals.get(intervals.size()-1).getDate().getTime();
	
						long diffSeconds = diff / 1000 % 60;
						long diffMinutes = diff / (60 * 1000) % 60;
						long diffHours = diff / (60 * 60 * 1000) % 24;
						long diffDays = diff / (24 * 60 * 60 * 1000);
	
						out.print((diffDays*-1) + " days, ");
						out.print((diffHours*-1) + " hours, ");
						out.print((diffMinutes*-1) + " minutes, ");
						out.print((diffSeconds*-1) + " seconds.");
					}
					 %></b></td>
				</tr>
				<%
				
			}
			
			%>
			</table>
  </div>
	  <div class="col-md-1" align="right">
		</div>
  </div>
  </div>
  </div>
  


</body>
</html>