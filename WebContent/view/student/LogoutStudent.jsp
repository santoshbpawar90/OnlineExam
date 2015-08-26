<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
<style>

.btn {
 background: #0074c2;
  background-image: -webkit-linear-gradient(top, #0074c2, #000000);
  background-image: -moz-linear-gradient(top, #0074c2, #000000);
  background-image: -ms-linear-gradient(top, #0074c2, #000000);
  background-image: -o-linear-gradient(top, #0074c2, #000000);
  background-image: linear-gradient(to bottom, #0074c2, #000000);
  -webkit-border-radius: 13;
  -moz-border-radius: 13;
  border-radius: 13px;
  font-family: Arial;
  color: #ffffff;
  font-size: 20px;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  font-weight:bolder;
  
  }
</style>




</head>
<body>
<% 
session.invalidate();
%>
<form name="submitpage" onmousemove ="changeHashOnLoad();" ></form>

<div  style=" border: 3px solid #606060; position: fixed;height:20% ;width:18%; top:30%;left: 35%; text-align: center; padding: 4%;" >




<table  border="0">
<tr>
<td>
  <h3 style="color: green;">Your result is submitted successfully </h3>
   </td>
</tr>


<tr>

<td>

<a href="LoginStudent.jsp"><input type="button" class="btn" value="End Exam" ></a>
</td>


</tr>
</table>
</div>
</body>
</html>