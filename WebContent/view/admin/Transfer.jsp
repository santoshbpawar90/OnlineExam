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

<style type="text/css">

</style>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
</head>
<body>


<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.min.js"></script>

<%@include file="QPackMain.jsp" %>

<script type="text/javascript">

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
  		 document.getElementById("myDivQPack").innerHTML="Sending...";
  		document.getElementById("download").disabled = true;
  		
  	}
  }
xmlhttp.open("GET","TransferAjax.jsp",true);
xmlhttp.send();
}


</script>

<br><br><br><br>
<%

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
	<div class="panel panel-primary">
  <!-- Default panel contents -->
  <div class="panel-heading" style="background-image: url('../../images/header-background-admin.jpg');"><b>Send Result</b></div>
  <div class="panel-body">
   
 <br><br>

  <div class="form-group">
	<div class="row">`
		
			<div class="col-md-4" align="right"><b style="font-size: medium;">Exam: </b><b style="color: purple;"><%if(pack!=null && pack.getqPackName()!=null){				
				out.print(pack.getqPackName());
			} %></b></div>
				<div class="col-md-3" align="right"><b style="font-size: medium;">Subject: </b><b style="color: purple;"><%if(pack!=null && pack.getSubName()!=null){				
				out.print(pack.getSubName());
			} %></b></div>
			
	  			
		</div>
	</div>
<hr>
<div align="left">
<font size="3px" style="text-align: center;"><b>Please click on "send" button to send the result to the server.</b></font>
</div>
<br>
	<div class="form-group">
	<div class="row">		
		  <div class="col-md-5" align="right"></div>
		  <div class="col-md-4"><input type="button" id="download" value="Send" class="btn btn-primary" style="font-weight: bolder;" onclick="showQpackStatus()">    </div>		 
	</div>
	<br>
	
	</div>
	
	<div class="row">		
		  <div class="col-md-4" align="right"></div>
		  <div class="col-md-3" align="left" id="myDivQPack" style="color: blue; font-size: medium;font-weight: bold;"></div>
		  <div class="col-md-2"></div>		   
		  <div class="col-md-3" align="right"> </div>
	</div>
	<br><br><br><br>
	</div>
	</div>
</body>
</html>