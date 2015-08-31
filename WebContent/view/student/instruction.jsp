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
 
  <p class="text-primary"> <font color="blue">You have to write this exam in one sitting and no breaks are allowed in between.</font></p>
  <p class="text-primary"> <font color="blue">If you have any doubt anywhere, please call the exam supervisor too seek possible assistance.</font></p>
  <p class="text-primary"> <font color="blue">During the exam, do not read aloud either the questions or the answers .</font></p>
  <p class="text-primary"> <font color="blue">You are not supposed to mishandle the computer equipment during the exam.</font></p>
  <p class="text-primary"> <font color="blue">You can press <b> SUBMIT </b>button once you are done with the exam .</font></p>
  <p class="text-primary"> <font color="blue">The exam would end automatically once the allowed duration is completed.</font></p>
  <p class="text-primary"> <font color="blue">Please attempt all questions in the Exam.</font></p>
  <p class="text-primary"> <font color="blue">You can review your answers during the exam and modify anytime. </font></p>
  <p class="text-primary"> <font color="blue">There are no negative marks in the exam .</font></p>
  <p class="text-primary"> <font color="blue">If any malpractice is noticed, the Exam supervisor has authority to stop your exam and may ask you to leave the exam center. </font></p>
  <p class="text-primary"> <font color="blue">During the exam, you are not supposed to indulge in any other activities like discussing, disturbing others etc. </font></p>
  </font>
  </div>
  
  <div class="radio" align="center">
  <img src="../../images/icon-yes.png" class="img-circle"  width="50" height="50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>	<input type="radio" required="required" name="optradio">&nbsp;&nbsp;<b> I have read the above instructions completely and agree to them</b></label>
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