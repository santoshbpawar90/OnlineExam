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
<style type="text/css">
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
 background-image: url("../../images/background-end-exam.jpg"); 
-webkit-background-size: cover;
background-repeat: no-repeat;
-moz-background-size: cover;
-o-background-size: cover;
background-size: auto;
}
div {
  opacity: 0.93;
}
</style>
</head>
<body>
<% 
//session.invalidate();

int uId=0;

if(request.getParameter("uId")!=null && !request.getParameter("uId").trim().equalsIgnoreCase(""))
{
	uId=Integer.parseInt(request.getParameter("uId"));
}
	
%>
<form name="submitpage" action="EndExam.jsp" onmousemove ="changeHashOnLoad();" >
<input type="hidden" name="uId" value="<%=uId %>">
<br><br><br><br><br><br><br><br>
<div class="container">
  
  <div class="panel panel-default col-md-4 col-md-offset-4" style="padding: 0%;">
    <div class="panel-heading" align="center" style="background-image: url('../../images/background-image-header-instruction.jpg'); background-size: cover;  ">
    <img src="../../images/icon-ok.png" class="img-circle"  width="50" height="50">
  <h4 style="color: #009999;">  Your result is submitted successfully </h4></div>
    <div class="panel-body" align="center">
    <input type="submit" name="submit" value="End Exam" class="btn btn-success">
    </div>
  </div>
</div>

</form>
</body>
</html>