<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>instruction</title>
<style type="text/css">
@font-face {
    font-family: myFirstFont;
    src: url(../../fonts/Roboto-Regular.ttf);
}

@font-face {
    font-family: myFirstFont;
    src: url(../../fonts/Roboto-Bold.ttf);
    font-weight: bold;
}

div {
    font-family: myFirstFont;
}



body {
background-image: url("../../images/background-image-instruction.jpg"); 
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
    
    
}
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


</head>
<link rel="stylesheet" href="../../css/styles.css" />


<body onload="changeHashOnLoad();">

<%
String id=request.getParameter("user");
%>

<form name="instruction" method="post" action="../../ReadXml">
<br><br>


			













  <div class="col-md-10 col-md-offset-1">
  <div class="panel panel-default" style="background-color: rgba(245, 245, 245, 0.3); border-color: ">
  <div class="panel-heading" style="background-image: url('../../images/background-image-header-instruction.jpg'); background-size: cover;  ">
  
  <h5 class="panel-title"><img src="../../images/icon-instructions.png" class="img-circle"  width="50" height="50"><b style="color: #009999; font-size: x-large;">&nbsp;&nbsp;&nbsp;&nbsp;Please read the following instructions carefully</b></h5>
  </div>
  <div class="panel-body" >
  
  <p class="text-primary">You have to write this exam in one sitting. No breaks are allowed. </p>
  <p class="text-primary">In case of doubts, please call the exam supervisor to seek assistance.</p>
  <p class="text-primary">During the exam, do not read out the questions/answers loudly.</p>
  <p class="text-primary">Do not mishandle any computer equipment during the exam.</p>
  <p class="text-primary">Press <b> SUBMIT </b>button once you have completed the exam.</p>
  <p class="text-primary">The exam would end automatically once duration exceeds.</p>
  <p class="text-primary">All questions are compulsory.</p>
  <p class="text-primary">You can review and modify your answers during the exam. </p>
  <p class="text-primary">There is no negative marks for the questions.</p>
  <p class="text-primary">The Exam supervisor has the authority to stop your exam and may ask you to leave the examination center in case any malpractice is detected.</p>
  <p class="text-primary">Do not indulge in activities like discussing, disturbing others etc. </p>
  
  </div>
  
  <div class="radio" align="center">
  <img src="../../images/icon-yes.png" class="img-circle"  width="50" height="50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>	<input type="checkbox" required="required" name="optradio">&nbsp;&nbsp; I have read and understood above instructions completely and agree to them</label>
  </div>
  <div align="center"> 
  <input type="submit" value="Start  Exam" class="btn btn-lg btn-success" style="font-weight:bolder;font-size: large;"  >
  </div>
  </div>
  </div>






						<input type="hidden" name="id" value="<%=id%>">
			
		
	
	</form>
</body>
</html>