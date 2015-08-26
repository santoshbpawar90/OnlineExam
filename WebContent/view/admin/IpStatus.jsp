<%@page import="manipal.onlineexam.student.entity.QPack"%>
<%@page import="manipal.onlineexam.student.dao.QPackDao"%>
<%@page import="manipal.onlineexam.util.SPConstants"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Active Status</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.min.js"></script>
<script type="text/javascript">

function myFunction() {
    setInterval(startDB(), <%=SPConstants.getInstance().getSpProperty("refresh.time")%>);
}



function startDB()
{
	
	console.log("start..");
	
	var xmlhttp;
	if (window.XMLHttpRequest)
 	 {// code for IE7+, Firefox, Chrome, Opera, Safari
 		 xmlhttp=new XMLHttpRequest();
 	 }
	else
 	 {// code for IE6, IE5
 		 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
  			document.getElementById("start").disabled=true;
  			document.getElementById("stop").disabled=false;		
	   
    	}
  		else
  		{
	  		console.log("loading..");
  		
  		
  		}
  	}
	xmlhttp.open("GET","IpStatusAjax.jsp",true);
	xmlhttp.send();
}



function stopDB()
{
	
	console.log("start..");
	document.getElementById("start").disabled="false";
	document.getElementById("stop").disabled="true";
	var xmlhttp;
	if (window.XMLHttpRequest)
 	 {// code for IE7+, Firefox, Chrome, Opera, Safari
 		 xmlhttp=new XMLHttpRequest();
 	 }
	else
 	 {// code for IE6, IE5
 		 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
  			document.getElementById("start").disabled=false;
  			document.getElementById("stop").disabled=true;	
	   
    	}
  		else
  		{
	  		
  		
  		
  		}
  	}
	xmlhttp.open("GET","IpStatusAjaxStop.jsp",true);
	xmlhttp.send();
	}

</script>
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

boolean flag=false;

QPackDao qPackDao=new QPackDao();
List<QPack> qPacks=qPackDao.getAllQPacks();
if(qPacks!=null)
for(QPack qPack:qPacks)
{
	if(qPack.getIntervalStatus() !=null && qPack.getIntervalStatus().equals("1"))
	{
		flag=true;
	}
	
}

%>

<br><br><br>
<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading"><b>Student Details</b></div>
  <div class="panel-body">
  <br>
   <div class="row">	
	  <div class="col-md-12" align="right">
	  	<input type="button" value="Start" id="start" style="font-weight: bolder;" class="btn btn-primary" onclick="startDB()"
	  	 <%if(flag){%>disabled="disabled" <%}%>>
	  	<input type="button" value="Stop" id="stop" style="font-weight: bolder;" class="btn btn-primary" onclick="stopDB()"
	  	<%if(!flag){%>disabled="disabled" <%}%> >
	  	<a href="IpStatus.jsp"><input type="button" value="Refresh" style="font-weight: bolder;" class="btn btn-primary" ></a>
	  	
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
				<td align="center"><b>Student Id</b></td>
				<td align="center"><b>Login Id</b></td>
				<td align="center"><b>Student</b></td>
				<td align="center"><b>IP Address</b></td>
				<td align="center"><b>Status</b></td>
				<td align="center"><b></b></td>
				
				
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
						<td align="center"><%=studentLogin.getIpAdd() %></td>
						<td align="center"><%
								try {
								    InetAddress address = InetAddress.getByName(studentLogin.getIpAdd());
								   out.print(address.getHostName());
								   out.print("<BR>"+address.getHostAddress());
								   out.print("<BR>"+address.getCanonicalHostName());
								    if(address.isReachable(10000)){
								    	out.println("<b style='color: green;'>Active</b>" );
								    }else{
								    	out.println("<b style='color: red;'>Inactive</b>" );
								    	
								    } 
								    
								    
								    
								    
								  }
								  catch (UnknownHostException e) {
								    System.err.println("Unable to lookup web.mit.edu");
								  }
								  catch (IOException e) {
								    System.err.println("Unable to reach web.mit.edu");
								  }
						
						 %></td>
						<td align="center"><a href="IpStatusDetails.jsp?id=<%=studentLogin.getId() %>">Check Details</a></td>
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
</div>
</div>



</body>
</html>