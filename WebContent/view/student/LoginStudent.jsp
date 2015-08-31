<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html |>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery-1.11.3.js"></script>


<style type="text/css">



.city {
    float: left;
    margin: 5px;
    padding: 15px;
    width: 300px;
    height: 300px;
  
}



</style>



















<style>
@font-face {
    font-family: myFirstFont;
    src: url(../../fonts/Roboto-Regular.ttf);
}

@font-face {
    font-family: myFirstFont;
    src: url(../../fonts/Roboto-Regular.ttf);
    font-weight: bold;
}

div {
    font-family: myFirstFont;
}

body {
background-image: url("../../images/background-image-login.jpg"); 
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}
.form-group {
    margin-bottom: 20px;
    background-color: rgba(255, 255, 255, 0.75);
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    }
div {
  opacity: 0.95;
}


<!--------------------------------------------------------->



.profile-header-img {
    padding: 54px;
}

.profile-header-img > img.img-circle {
   
    border: 2px solid #51D2B7;
}

.profile-header {
    margin-top: 43px;
}

/**
 * Ranking component
 */


.label.label-default.rank-label {
    background-color: rgb(81, 210, 183);
    padding: 5px 10px 5px 10px;
    border-radius: 27px;
}

<!--------------------------------------------------------->


</style>


<script type="text/javascript">




function changeHashOnLoad() {
    window.location.href += "#";
    setTimeout("changeHashAgain()", "50"); 
}

function changeHashAgain() {
 window.location.href += "1";
}

var storedHash = window.location.hash;
window.setInterval(function () {
   if (window.location.hash != storedHash) {
        window.location.hash = storedHash;
   }
}, 50);



</script>
<title>Login</title>
</head>
<body onload="changeHashOnLoad(); ">
<form action="../../StudentLoginServlet" method="post">

<div class="container-fluid" style="padding:10%;" >

<div class="row" ></div>
<div class="row" >
<div class="col-md-1"  ></div>		
<div class="col-md-1" style="border-bottom-color: black;" ></div>
<div class="col-md-6"></div>
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4  col-sm-6 col-sm-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading" style="background-image: url('../../images/background-image-header-instruction.jpg'); ">
			  	
			    	<h3 class="panel-title" style="margin-left: 10%;"><img src="../../images/icon-login.png" class="img-circle"  width="50" height="50" align="center">&nbsp;&nbsp;<font size="20px;" >Sign in </font></h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="Username" name="userName" type="text" required="required">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" type="password" value="" required="required">
			    		</div>
			    		
			    		<!-- <input class="btn btn-lg btn-success btn-block" type="submit" value="Login"> -->
			    		<button type="submit" class="btn btn-lg btn-success btn-block">
 <b>  Login  </b> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
</button>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
<div class="col-md-1"  ></div>
<div class="col-md-4"></div>
</div>



		
	</form>
</body>
</html>