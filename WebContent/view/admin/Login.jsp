<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page language="java" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<title>Login</title>


<style type="text/css">
body {
background-image: url("../../images/background-admin-login.jpg"); 
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
background-position: center;
}

</style>
</head>
<body >
<form action="../../LoginServlet" method="post" autocomplete="off">
<div class="container-fluid">
<br><br><br><br>
<br><br><br><br>

<div class="row">
		
			<div class="col-md-4"></div>
<div class="col-md-4">
<div class="panel panel">
  
  <div class="panel-heading" style="background-image: url('../../images/header-background-admin.jpg'); background-position: center; " ><b>LOGIN</b></div>
  <div class="panel-body">
    
  


	<div class="form-group" >
	<div class="row">
		
			<div class="col-md-4" align="right"><b>Username:</b></div>
	  			<div class="col-md-7" style="margin-top: -1%">
	  				<input type="text" class="form-control" name="userName" required="required" placeholder="Username"></div>
		</div>
	</div>
	
	<div class="form-group" style="margin-top: 6%">
	<div class="row">		
		  <div class="col-md-4" align="right" style="margin-top: 1%"><b>Password:</b></div>
		  <div class="col-md-7"><input type="password" class="form-control" required="required" name="password" placeholder="Password"></div>
		</div>
	</div>
	
	<div class="form-group">
	<div class="row">	
	  <div class="col-md-4" align="right"></div>
	  <div class="col-md-7"><input type="submit" value="LOGIN" style="font-weight: bolder;" class="btn btn-info btn-md btn-block" name="password" ></div>
	 </div>
	</div>
</div>
</div>
</div>
<div class="col-md-4"></div>
</div>
</div>
</form>
</body>
</html>