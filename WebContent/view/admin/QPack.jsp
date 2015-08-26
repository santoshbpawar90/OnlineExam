<%@page import="java.text.SimpleDateFormat"%>
<%@page import="manipal.onlineexam.student.entity.QPack"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.dao.QPackDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" session="false"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Exam System-Local Server Management</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.min.js"></script>

<%@include file="QPackMain.jsp" %>
<script>


function showQpackStatus()
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
    document.getElementById("myDivQPack").innerHTML=xmlhttp.responseText;
    document.getElementById("download").disabled = false;
    console.log("got it..");
    }
  	else
  	{
  		console.log("loading..");
  		 document.getElementById("myDivQPack").innerHTML="Loading...";
  		document.getElementById("download").disabled = true;
  		
  	}
  }
xmlhttp.open("GET","QPackAjax.jsp",true);
xmlhttp.send();
}


function myFunction() {
    location.reload();
}

</script>
</head>
<body>
<br>
	<!-- <div class="form-group">
	<div class="row">`
		
			<div class="col-md-4" align="right"><b>Name Of Exam:</b></div>
	  			<div class="col-md-4">  				</div>
		</div>
	</div> -->
	
	<br>
	<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading"><b>QPack Management</b></div>
  <div class="panel-body">
   
 


	<div class="form-group">
	<div class="row">		
		  <div class="col-md-2" align="right"></div>
		  <div class="col-md-4"><b>QPack download Status: </b><input type="button" id="download" value="Download QPack" class="btn btn-primary" style="font-weight: bolder;" onclick="showQpackStatus()">    </div>
		   <div class="col-md-3" align="left"  style="color: blue; font-size: medium;font-weight: bold;"></div>
		  <div class="col-md-3" align="right"> <input type="button" value="Refresh" onclick="myFunction()" style="font-weight: bolder;" class="btn btn-primary" ></div>
	</div>
	<br>
	<div class="row">		
		  <div class="col-md-4" align="right"></div>
		  <div class="col-md-3" align="left" id="myDivQPack" style="color: blue; font-size: medium;font-weight: bold;"></div>
		  <div class="col-md-2"></div>		   
		  <div class="col-md-3" align="right"> </div>
	</div>
	<!-- <div class="form-group">
	<div class="row">		
		  <div class="col-md-4" align="right"><b>Student Info download Status: </b></div>
		  <div class="col-md-4"><input type="button" value="DownLoad Student Info" class="btn btn-primary" onclick="showStudStatus()"><div id="myDivStud"></div>    </div>
		</div>
	</div> -->
	
	<!-- <div class="form-group">
	<div class="row">	
	  <div class="col-md-4" align="right"><b>Force Sync Up With Central Server:</b></div>
	  <div class="col-md-4"><input type="button" value="Force DownLoad QPack" class="btn btn-primary" ></div>
	 </div>
	</div> -->
	<br>
	
	<hr>
<br>

<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading"><b>Available QPack</b></div>
  <div class="panel-body">
  <br>
<form action="../../ActivatePack" method="post">
<div class="form-group">
	<div class="row">	
	<div class="col-md-4" align="right"></div>
	  <div class="col-md-5" align="right"></div>
	  <div class="col-md-3" ><b>Activate Exam:</b> <input type="submit"  value="Activate" name="Activate" style="font-weight: bolder;" class="btn btn-success" >
	  
	  </div>
	 </div>
	</div>
<div class="row">	
	  <div class="col-md-1" align="right">
	  </div>
	  <div class="col-md-10" align="right">
	  
	  	
	  	<table class="table table-bordered table-hover">
			<tr class="info">
				<td align="center" ><b>Select</b></td>
				<td align="center"><b>Exam</b></td>
				<td align="center"><b>Subject</b></td>
				<td align="center"><b>Download Date</b></td>
				<!-- <td>Path</td> -->
				<td align="center"><b>Duration</b></td>
				<td align="center"><b>Activation Status</b> </td>
			</tr>
			
			<%
			
			QPackDao qPackDao=new QPackDao();
			List<QPack> qPacks=qPackDao.getAllQPacks();
			if(qPacks!=null)
			for(QPack qPack:qPacks)
			{
				%>
				<tr>
				<td align="center"><input type="radio" name="rdo"
				<%if(qPack.getActivationStatus()!=null && qPack.getActivationStatus().equals("1")){%>disabled="disabled" <%}%> value="<%=qPack.getId()%>" required="required"> </td>
				<td align="center"><%=qPack.getqPackName() %></td>
				<td align="center"><%=qPack.getSubName() %></td>
				<td align="center"><%if(qPack!=null && qPack.getDate()!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy,HH:mm:ss");
				out.print(sdf.format(qPack.getDate()));
					} %></td>
				<%-- <td><%=qPack.getPath() %></td> --%>
				<td align="center"><%=qPack.getDuration() %> min</td>
				<td align="center"><%if(qPack.getActivationStatus()!=null && qPack.getActivationStatus().equals("1")){out.print("Active");}else{out.print("Inactive");}  %></td>
				</tr>
				<%	
			}
				
				
			
			%>
		</table>
		<div class="col-md-1" align="right">
		</div>
	</div>
	</div>
	</form>
	<br><br><br>
	</div>
	</div>
	
	
	 </div>  
</div>
</body>
</html>