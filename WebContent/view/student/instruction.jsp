<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>instruction</title>

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
	<div style="text-align: center;">
		<div style="margin-left: 8%; width: 84%;height: auto;margin-top:1%;"  >
			<!-- <div style="border: solid 2px;"><img alt="logo"  src="../../images/instructions.jpg"></div> -->
			
			<table  style="text-align: center;width: 100%;"  >
			
			<tr >
					<td align="left" ><h3 style="color: blue;"><b> Please read the following instructions carefully . . .<b></h3> </td>
			
			</tr>
			
		
<tr align="left"><td><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.You have to write this exam in one sitting and no breaks are allowed in between </h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	If you have any doubt anywhere, please call the exam supervisor too seek possible assistance</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	During the exam, do not read aloud either the questions or the answers</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	You are not supposed to mishandle the computer equipment during the exam</h5></td></tr>
<tr align="left"><td "><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	You can press SUBMIT button once you are done with the exam</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.	The exam would end automatically once the allowed duration is completed</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.	Please attempt all questions in the Exam</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.	You can review your answers during the exam and modify anytime</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. There are no negative marks in the exam</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10. If any malpractice is noticed, the Exam supervisor has authority to stop your exam and may ask you to leave the exam center</h5></td></tr>
<tr align="left"><td ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11. During the exam, you are not supposed to indulge in any other activities like discussing, disturbing others etc.</h5></td></tr>
<tr><td align="left"><b><h3 style="color: blue;">All the best for your exam!!</h3></b> </td></tr>
<tr><td align="center" style="padding: 1%;"><b><h5 style="color: blue;"><input type="checkbox" required="required">&nbsp;&nbsp;I have read the above instructions completely and agree to them</b> </td></tr>
	</table>
			
		</div>
		
		<div style="margin-top: 1%;">

						<input type="hidden" name="id" value="<%=id%>">
			
						<input type="submit" value="Start  Exam" class="btn btn-primary" style="font-weight:bolder;font-size: large;">
		</div>
		<br>
	</div>
	</form>
</body>
</html>