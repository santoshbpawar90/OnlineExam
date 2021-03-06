<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="manipal.onlineexam.util.QuestionClass"%>
<!DOCTYPE html |>
<html  style="height: 100%; ">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/exambuttonsevent.js">  </script>
<script type="text/javascript" src="js/css-pop.js"></script>
<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Exam Paper</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style type="text/css">

.btn-default {
    text-shadow: 0px 1px 0px #FFF;
    background-image: linear-gradient(to bottom, #FFF 0px, #E0E0E0 100%);
    background-repeat: repeat-x;
    border-color: #080606;
}


@font-face {
    font-family: myFirstFont;
    src: url(fonts/Roboto-Regular.ttf);
}

@font-face {
    font-family: myFirstFont;
    src: url(fonts/Roboto-Bold.ttf);
    font-weight: bold;
}

div {
    font-family: myFirstFont;
}


</style>

<script>
$(document).ready(function(){
		$("#divmain").css({<%=request.getAttribute("DivMain")%>});
		$("#divmenu").css({<%=request.getAttribute("DivMenu")%>});
});
</script>


</head>
<div style="border: solid 1px;width: 90%;height: 550px;margin-left: 5%;">
<!------------------body start------------------------>
<body style="height: 98%; onload="start();">
<!------------------form start------------------------>
<form  style="height: 100%" method="post" action="StudentSubmitServlet" >
<!------------------panel-full-page start------------------------>
<div class="container-fluid" style="height: 100%;" >





<!------------------panel-default start------------------------>
<div class="panel panel-default col-md-9 col-sm-9 " style="padding: 0%;height: 99%; " id="divmain">
<!------------------panel-heading start------------------------>
<div class="panel-heading" style=" padding-left: 1%; background-image: url('images/head-exam.jpg'); background-size: cover;  ">
<div class="panel-title"><img src="images/icons-online-exam.jpg" class="img-circle"  width="80" height="75"><b style="color: #009999; font-size: xx-large;">&nbsp;&nbsp;Exam Portal</b></div>

</div>
 <!------------------panel-body start------------------------>
 <div class="panel-body" style="display: block; height: 76%;" >
 
 <!---------------------------panel-question-anwser start------------------------------->
 
 <div style="border: solid 2px;height: auto;width: 100%; float: left;margin: 5px;padding: 15px;">
 
 <div class="panel-question-anwser">
  <% ArrayList<QuestionClass> questions=(ArrayList<QuestionClass>) request.getAttribute("qlist"); 
		int count=0;
		if(questions!=null)
		for(QuestionClass ques:questions)
			{count++;%>
<div id="<%=count%>" <%if(count==1){%>style="display:block;"<%}else{%>style="display:none;"<%} %> >
						<table >
						<tr>
						<td>
<input type="hidden" name="hdnQId<%=count%>" id="hdnQId<%=count%>" value="<%=ques.getQuestionId()%>">

<p style="font-size:large; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Question No&nbsp;&nbsp;&nbsp;<%=count %></p>


						</td>
						</tr>
						<tr>
					
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%=ques.getQuestion() %>
<br>
<br>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
A.&nbsp;&nbsp;&nbsp;

<input id="Option " type="radio" name="option<%=count %>" value="1" onclick="save(this);">
 <%=ques.getOption1() %>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
B.&nbsp;&nbsp;&nbsp;						
<input id="Option" type="radio"  name="option<%=count %>" value="2" onclick="save(this);">
 <%=ques.getOption2() %>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
C.&nbsp;&nbsp;&nbsp;						
<input id="Option" type="radio" name="option<%=count %>" value="3" onclick="save(this);">
 <%=ques.getOption3() %>
						</td>
						</tr>
					    <tr>
					  
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
D.&nbsp;&nbsp;&nbsp;					
<input id="Option" type="radio" name="option<%=count %>" value="4" onclick="save(this);">
 <%=ques.getOption4() %>
						</td>
						</tr>
						</table>
						</div>
							<%
						}
						
						%>
<input type="hidden" name="count" id="count" value="<%=count%>">
 </div>
 </div>
 
 <!---------------------------panel-question-anwser end------------------------------->
 <!------------------panel-footer start------------------------>
 

  <!-------------------------panel-question-buttons start--------------------------------->
  <div class="panel-question-buttons">

<input type="button" class="btn btn-success" value="Clear Response" onclick="clearR();save(this);" id="ClearResponseClick" >
<input type="button" class="btn btn-success" value="Mark for Review & Next" onclick="markandreview();save(this);" id="MarkNReviewClick" >
<input type="button" class="btn btn-success" value="Save & Next" onclick="saveQidOption('save');save(this);" id="SaveClick">
  


 
</div> 
 
 <!------------------panel-footer end------------------------>
 </div>
 <!------------------panel-body end------------------------> 
  
 
</div>
<!------------------panel-default end------------------------>
   
      
<!------------------|\  /| |''''  |\  |  |   |------------>      
<!------------------| \/ | |''''  | \ |  |   |------------>      
<!------------------|    | |____  |  \|  |___|------------->      
<!-- ------------------------||||------------------------- -->  
<!-- ---------------------\--||||--/----------------------- --> 
<!-- ----------------------\-||||-/------------------------ --> 
<!-- -----------------------\-||-/----------------------- -->     
<!-- ------------------------\||/------------------------ -->       
<!-- -------------------------\/------------------------ -->  



 <!------------------panel-default start------------------------>
<div class="panel panel-default col-md-3 col-sm-3 " style="height: 99%; background-image: url('images/back-menu3.jpg');  background-position: top;" id="divmenu" >
 <!------------------panel-body-menu start------------------------>
 <div class="panel-body-menu" style="height:100%;">
 
 <!---------------------------panel-timer start------------------------------->
 <div class="panel-timer" style="height:20%; " >

  <div >Time Left:&nbsp; <span id="time" style="color: red;"></span></div>
 </div> 
 <!----------------------------panel-timer end------------------------------>
 <!----------------------------panel-student-info start------------------------------>
 <div class="panel-student-info" style="position:absolute;top:16%; height:20%;">
<table >
<tr>
<td align="center" >
<img   src="<% if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath").toString().trim());} %>" class="img-circle"  width="110" height="110">
</td>
<td >
<table >
<tr>
<td><h4>&nbsp;&nbsp;<%=request.getAttribute("studId") %></h4></td>
</tr>
<tr>
<td><h4 style="font-weight: bold;" class="text-success">&nbsp;&nbsp;<%=request.getAttribute("Name") %></h4></td>
</tr>
</table>
</td>
</tr>
</table>
<div><span> <input type="hidden"name="username"   id="username"  value="<%=request.getAttribute("username") %>" readonly="readonly" ></span></div>
<div><span><input type="hidden" name="subject"    id="subject"   value="<%=request.getAttribute("subject") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="college"    id="college"   value="<%=request.getAttribute("college") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="timegiven"  id="timegiven" value="<%=request.getAttribute("time") %>"     readonly="readonly" ></span></div>
<div><span><input type="hidden" name="examId"     id="examId"    value="<%=request.getAttribute("examId") %>"   readonly="readonly" ></span></div>
<div><span><input type="hidden" name="paperId"    id="paperId"   value="<%=request.getAttribute("paperId") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="subId"      id="subId"     value="<%=request.getAttribute("subId") %>"    readonly="readonly" ></span></div>
<div><span><input type="hidden" name="studId"     id="studId"    value="<%=request.getAttribute("studId") %>"   readonly="readonly" ></span></div>
<div><span><input type="hidden" name="finalanwser"id="finalanwser" value=""></span></div>
<div><span><input type="hidden" name="uId"     id="uId"    value="<%=request.getAttribute("uId") %>"   readonly="readonly" ></span></div>	       
	       
	       
 </div>
 <!----------------------------panel-student-info end------------------------------>
 <!--------------------------panel-question-palette start-------------------------------->
  <div class="panel-question-palette" style="position:absolute;bottom:20%; height: 40%;width: 90%;">
<div class="questionbutton" id="questionMenu" onclick="save(this);" style="padding: 2%;width:100%; height:100%;overflow-y: scroll; ">
</div>
 </div>
  <!-------------------------panel-question-palette end---------------------------------> 
 <!---------------------------panel-menu-buttons start------------------------------->
 <br>
 <div class="panel-menu-buttons"  style="position: absolute;bottom:2%;">
 <table align="center" style="border-collapse: separate;
    border-spacing: 5px;" >

<tr >

<td align="center">

<button type="button" class="btn btn-success" style="width: 28px;height: 28px;"></button>
</td> 
<td align="left">Answered
</td>
<td></td>
<td></td>
<td align="center">
<button type="button" class="btn btn-warning" style="width: 28px;height: 28px;" ></button>
</td>
<td align="left">Not Answered
</td>
</tr>

<tr>
<td align="center">
<button type="button" class="btn btn-info" style="width: 28px;height: 28px;"></button>
</td>
<td align="left">Marked 
</td>
<td></td>
<td></td>
<td align="center">
<button type="button" class="btn btn-default" style="width: 28px;height: 28px;"></button>
</td>
<td align="left">Not Visited
</td>
</tr>
</table>
<table>
<tr>
 
<!-- <input type="button" class="btn" value="Question Paper" onclick="questionpopup()"> -->
<td>
&nbsp;<input type="button" class="btn btn-success " value="Profile" data-toggle="modal" data-target="#myModalProfile" onclick="save(this);" id="ProfileClick">
</td>
<td>
&nbsp;<input type="button" class="btn btn-success" value="Instructions" data-toggle="modal" data-target="#myModalInstruction" onclick="save(this);" id="InstructionClick">
</td>
<td>
&nbsp;<input type="button" class="btn btn-success" value="Submit" data-toggle="modal" data-target="#submitwarning"   id="submitbutton">
</td>

</tr>
</table>
 </div> 
 <!---------------------------panel-menu-buttons end------------------------------->

 </div>
 <!------------------panel-body-menu end------------------------> 
  </div>
<!------------------panel-default end------------------------>




</div>
<!------------------panel-full-page end------------------------>
<div>
<div id="blanket" style="display:none;"></div>
<div id="popUpDiv" style="display:none;">

 <a href="#" onclick="initTime();popup('popUpDiv');" style="text-align: center; top:36%; color: white;margin-left: 20%; font-weight: bold; font-size: xx-large;" >Start Exam</a> 
</div>
</div>
 <div class="container">
<div>
 <div id="submitblack" style="display:none;"></div>
<div id="popsubmit" style="display:none;">
<p style="color: white;"></p>
  <a href="#" onclick="timeupsubmit()" style="text-align: center; color: white;margin-left: 33%;top: 36%; font-size: xx-large;font-weight: bold; " >Submit</a>
</div> 
</div>
</div>
<!------------------submit-alert-info--------------------------><!------------------submit-alert-info-------------------------->

 <div class="container">
 
  

  <!-- Modal -->
  <div class="modal fade" id="submitwarning" role="dialog" style="top:30%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" align="center" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Are You Sure You Want To Submit.</h4>
        </div>
        <div class="modal-body" align="center">
        <input type="submit" name="submit" value="Yes" id="finalsubmit" class="btn btn-success">
        </div>
        
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------submit-alert-info-end-------------------------><!------------------submit-alert-info-end------------------------>
<!------------------save-alert-info--------------------------><!------------------save-alert-info-------------------------->

 <div class="container">
 
  <!-- Trigger the modal with a button -->
  <input type="button" value="warning" id="savewarning" style="display: none;"    data-toggle="modal" data-target="#myModal">

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="top:30%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Please select anwser</h4>
        </div>
        <div class="modal-body">
        </div>
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------save-alert-info--------------------------><!------------------save-alert-info------------------------->


<!------------------profile-popup-info--------------------------><!------------------profile-popup-info-------------------------->

 <div class="container">
 
  <!-- Trigger the modal with a button -->
  <!-- <input type="button" value="warning" id="savewarning" style="display: none;"    data-toggle="modal" data-target="#myModal"> -->

  <!-- Modal -->
  <div class="modal fade" id="myModalProfile" role="dialog" style="top:1%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" style="background-image: url('images/background-image-header-instruction.jpg'); background-size: cover;  background-position: left;" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h5 class="modal-title"><img   src=" <% if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath"));} %>" class="img-circle"  width="110" height="110"><b style="color: #009999; font-size: x-large;">&nbsp;&nbsp;<%=request.getAttribute("Name") %>&nbsp; Profile</b></h5>
         
        </div>
        <div class="modal-body">
         <table class="table">
    
    <tbody>
      <tr class="success">
       
        <td>Student ID</td>
        <td><%=request.getAttribute("studId") %></td>
      </tr>
      <tr class="success">
        
        <td>Student Name</td>
        <td><%=request.getAttribute("Name") %></td>
      </tr>
      <tr class="success">
        
        <td>Student Username</td>
        <td><%=request.getAttribute("username") %></td>
      </tr>
      <tr class="success">
       
        <td>Subject</td>
        <td><%=request.getAttribute("subject") %></td>
      </tr>
      <tr class="success">
        
        <td>Collage Name</td>
        <td><%=request.getAttribute("college") %></td>
      </tr>
      <tr class="success">
        
        <td>Exam Duration (Minutes)</td>
        <td><%=request.getAttribute("time") %></td>
      </tr>
      <tr class="success">
       
        <td>Exam ID</td>
        <td><%=request.getAttribute("examId") %></td>
      </tr>
      <tr class="success">
        
        <td>Paper ID</td>
        <td><%=request.getAttribute("paperId") %></td>
      </tr>
      <tr class="success">
        
        <td>Subject ID</td>
        <td><%=request.getAttribute("subId") %></td>
      </tr>
    </tbody>
  </table> 
        </div>
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------profile-popup-info--------------------------><!------------------profile-popup-info------------------------->

<!------------------instruction-popup-info--------------------------><!------------------instruction-popup-info-------------------------->

 <div class="container">
 
  <!-- Trigger the modal with a button -->
  <!-- <input type="button" value="warning" id="savewarning" style="display: none;"    data-toggle="modal" data-target="#myModalInstruction"> -->

  <!-- Modal -->
  <div class="modal fade" id="myModalInstruction" role="dialog" style="top:10%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" style="background-image: url('images/background-image-header-instruction.jpg'); background-size: cover;  background-position: center;" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          <h5 class="modal-title"><img src="images/icon-instructions.png" class="img-circle"  width="50" height="50"><b style="color: #009999; font-size: x-large;">&nbsp;&nbsp;&nbsp;&nbsp;Instructions</b></h5>
          </div>
          <div class="modal-body" style="color: black;">
           <p class="text-primary">You have to write this exam in one sitting and no breaks are allowed in between </p>
  <p class="text-primary">If you have any doubt anywhere, please call the exam supervisor too seek possible assistance</p>
  <p class="text-primary">During the exam, do not read aloud either the questions or the answers </p>
  <p class="text-primary">You are not supposed to mishandle the computer equipment during the exam</p>
  <p class="text-primary">You can press <b> SUBMIT </b>button once you are done with the exam </p>
  <p class="text-primary">The exam would end automatically once the allowed duration is completed</p>
  <p class="text-primary">Please attempt all questions in the Exam</p>
  <p class="text-primary">You can review your answers during the exam and modify anytime </p>
  <p class="text-primary">There are no negative marks in the exam </p>
  <p class="text-primary">If any malpractice is noticed, the Exam supervisor has authority to stop your exam and may ask you to leave the exam center </p>
  <p class="text-primary">During the exam, you are not supposed to indulge in any other activities like discussing, disturbing others etc. </p>
        </div>
        
        
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------instruction-popup-info--------------------------><!------------------instruction-popup-info------------------------->


</form>
<!------------------form end-------------------------->

</div>
</body>
<!------------------body end------------------------>
</html>

 --%>
 
 
 
 
 
 
 
 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="manipal.onlineexam.util.QuestionClass"%>
<!DOCTYPE html |>
<html  style="height: 98%; ">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/exambuttonsevent.js">  </script>
<script type="text/javascript" src="js/css-pop.js"></script>
<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Exam Paper</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style type="text/css">

.btn-default {
    text-shadow: 0px 1px 0px #FFF;
    background-image: linear-gradient(to bottom, #FFF 0px, #E0E0E0 100%);
    background-repeat: repeat-x;
    border-color: #080606;
}


@font-face {
    font-family: myFirstFont;
    src: url(fonts/Roboto-Regular.ttf);
}

@font-face {
    font-family: myFirstFont;
    src: url(fonts/Roboto-Bold.ttf);
    font-weight: bold;
}

div {
    font-family: myFirstFont;
}


</style>

<script>
$(document).ready(function(){
		$("#divmain").css({<%=request.getAttribute("DivMain")%>});
		$("#divmenu").css({<%=request.getAttribute("DivMenu")%>});
});
</script>


</head>






<!------------------body start------------------------>
<body style="height: 100%;" onload="start();popup('popUpDiv')">

<div style="width: 90%;height: 630px;margin-left: 5%;">


<!------------------form start------------------------>
<form  style="height: 100%" method="post" action="StudentSubmitServlet" >
<!------------------panel-full-page start------------------------>
<div class="container-fluid" style="height: 100%;" >





<!------------------panel-default start------------------------>
<div class="panel panel-default col-md-9 col-sm-9 " style="padding: 0%;height: 99%; " id="divmain">
<!------------------panel-heading start------------------------>
<div class="panel-heading" style=" padding-left: 1%; background-image: url('images/head-exam.jpg'); background-size: cover;  ">
<div class="panel-title"><img src="images/icons-online-exam.jpg" class="img-circle"  width="80" height="75"><b style="color: #009999; font-size: xx-large;">&nbsp;&nbsp;Exam Portal</b></div>

</div>
 <!------------------panel-body start------------------------>
 <div class="panel-body" style="display: block; height: 76%;" >
 
 <!---------------------------panel-question-anwser start------------------------------->
 <div class="panel-question-anwser">
  <% ArrayList<QuestionClass> questions=(ArrayList<QuestionClass>) request.getAttribute("qlist"); 
		int count=0;
		if(questions!=null)
		for(QuestionClass ques:questions)
			{count++;%>
<div id="<%=count%>" <%if(count==1){%>style="display:block;"<%}else{%>style="display:none;"<%} %> >
						<table >
						<tr>
						<td>
<input type="hidden" name="hdnQId<%=count%>" id="hdnQId<%=count%>" value="<%=ques.getQuestionId()%>">

<p style="font-size:large; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Question No&nbsp;&nbsp;&nbsp;<%=count %></p>


						</td>
						</tr>
						<tr>
					
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%=ques.getQuestion() %>
<br>
<br>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
A.&nbsp;&nbsp;&nbsp;

<input id="Option " type="radio" name="option<%=count %>" value="1" onclick="save(this);">
 <%=ques.getOption1() %>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
B.&nbsp;&nbsp;&nbsp;						
<input id="Option" type="radio"  name="option<%=count %>" value="2" onclick="save(this);">
 <%=ques.getOption2() %>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
C.&nbsp;&nbsp;&nbsp;						
<input id="Option" type="radio" name="option<%=count %>" value="3" onclick="save(this);">
 <%=ques.getOption3() %>
						</td>
						</tr>
					    <tr>
					  
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
D.&nbsp;&nbsp;&nbsp;					
<input id="Option" type="radio" name="option<%=count %>" value="4" onclick="save(this);">
 <%=ques.getOption4() %>
						</td>
						</tr>
						</table>
						</div>
							<%
						}
						
						%>
<input type="hidden" name="count" id="count" value="<%=count%>">
 </div>
 <!---------------------------panel-question-anwser end------------------------------->
 <!------------------panel-footer start------------------------>
 <div class="panelfooter "  style=" border: 1px #e4e4e4 solid; position:absolute; bottom: 5px; " >
  <!-------------------------panel-question-buttons start--------------------------------->
  <div class="panel-question-buttons">

<input type="button" class="btn btn-success" value="Clear Response" onclick="clearR();save(this);" id="ClearResponseClick" >
<input type="button" class="btn btn-success" value="Mark for Review & Next" onclick="markandreview();save(this);" id="MarkNReviewClick" >
<input type="button" class="btn btn-success" value="Save & Next" onclick="saveQidOption('save');save(this);" id="SaveClick">
  

 </div>
 <!---------------------------panel-question-buttons end------------------------------->
 
 </div>
 <!------------------panel-footer end------------------------>
 </div>
 <!------------------panel-body end------------------------> 
  
 

<!------------------panel-default end------------------------>
   
      
      
   </div>    
      
      
      
      
      
      
      
      
<!------------------|\  /| |''''  |\  |  |   |------------>      
<!------------------| \/ | |''''  | \ |  |   |------------>      
<!------------------|    | |____  |  \|  |___|------------->      
<!-- ------------------------||||------------------------- -->  
<!-- ---------------------\--||||--/----------------------- --> 
<!-- ----------------------\-||||-/------------------------ --> 
<!-- -----------------------\-||-/----------------------- -->     
<!-- ------------------------\||/------------------------ -->       
<!-- -------------------------\/------------------------ -->  



 <!------------------panel-default start------------------------>
<div class="panel panel-default col-md-3 col-sm-3 " style="height: 99%; background-image: url('images/back-menu3.jpg');  background-position: top;" id="divmenu" >
 <!------------------panel-body-menu start------------------------>
 <div class="panel-body-menu" style="height:100%; ">
 
 <!---------------------------panel-timer start------------------------------->
 <div class="panel-timer" style="height:20%; " >

  <div >Time Left:&nbsp; <span id="time" style="color: red;"></span></div>
 </div> 
 <!----------------------------panel-timer end------------------------------>
 <!----------------------------panel-student-info start------------------------------>
 <div class="panel-student-info" style="position:absolute;top:16%; height:20%;">
<table >
<tr>
<td align="center" >
<img   src="<% if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath").toString().trim());} %>" class="img-circle"  width="110" height="110">
</td>
<td >
<table >
<tr>
<td><h4>&nbsp;&nbsp;<%=request.getAttribute("studId") %></h4></td>
</tr>
<tr>
<td><h4 style="font-weight: bold;" class="text-success">&nbsp;&nbsp;<%=request.getAttribute("Name") %></h4></td>
</tr>
</table>
</td>
</tr>
</table>
<div><span> <input type="hidden"name="username"   id="username"  value="<%=request.getAttribute("username") %>" readonly="readonly" ></span></div>
<div><span><input type="hidden" name="subject"    id="subject"   value="<%=request.getAttribute("subject") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="college"    id="college"   value="<%=request.getAttribute("college") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="timegiven"  id="timegiven" value="<%=request.getAttribute("time") %>"     readonly="readonly" ></span></div>
<div><span><input type="hidden" name="examId"     id="examId"    value="<%=request.getAttribute("examId") %>"   readonly="readonly" ></span></div>
<div><span><input type="hidden" name="paperId"    id="paperId"   value="<%=request.getAttribute("paperId") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="subId"      id="subId"     value="<%=request.getAttribute("subId") %>"    readonly="readonly" ></span></div>
<div><span><input type="hidden" name="studId"     id="studId"    value="<%=request.getAttribute("studId") %>"   readonly="readonly" ></span></div>
<div><span><input type="hidden" name="finalanwser"id="finalanwser" value=""></span></div>
<div><span><input type="hidden" name="uId"     id="uId"    value="<%=request.getAttribute("uId") %>"   readonly="readonly" ></span></div>	       
	       
	       
 </div>
 <!----------------------------panel-student-info end------------------------------>
 <!--------------------------panel-question-palette start-------------------------------->
  <div class="panel-question-palette" style="position:absolute;bottom:20%; height: 40%;width: 90%;">
<div class="questionbutton" id="questionMenu" onclick="save(this);" style="padding: 2%;width:100%; height:100%;overflow-y: scroll; ">
</div>
 </div>
  <!-------------------------panel-question-palette end---------------------------------> 
 <!---------------------------panel-menu-buttons start------------------------------->
 <br>
 <div class="panel-menu-buttons"  style="position: absolute;bottom:2%;">
 <table align="center" style="border-collapse: separate;
    border-spacing: 5px;" >

<tr >

<td align="center">

<button type="button" class="btn btn-success" style="width: 28px;height: 28px;"></button>
</td> 
<td align="left">Answered
</td>
<td></td>
<td></td>
<td align="center">
<button type="button" class="btn btn-warning" style="width: 28px;height: 28px;" ></button>
</td>
<td align="left">Not Answered
</td>
</tr>

<tr>
<td align="center">
<button type="button" class="btn btn-info" style="width: 28px;height: 28px;"></button>
</td>
<td align="left">Marked 
</td>
<td></td>
<td></td>
<td align="center">
<button type="button" class="btn btn-default" style="width: 28px;height: 28px;"></button>
</td>
<td align="left">Not Visited
</td>
</tr>
</table>

<table>
<tr>
 
<!-- <input type="button" class="btn" value="Question Paper" onclick="questionpopup()"> -->
<td>
&nbsp;<input type="button" class="btn btn-success " value="Profile" data-toggle="modal" data-target="#myModalProfile" onclick="save(this);" id="ProfileClick">
</td>
<td>
&nbsp;<input type="button" class="btn btn-success" value="Instructions" data-toggle="modal" data-target="#myModalInstruction" onclick="save(this);" id="InstructionClick">
</td>
<td>
&nbsp;<input type="button" class="btn btn-success" value="Submit" data-toggle="modal" data-target="#submitwarning"   id="submitbutton">
</td>

</tr>
</table>

 </div> 
 <!---------------------------panel-menu-buttons end------------------------------->

 </div>
 <!------------------panel-body-menu end------------------------> 
  </div>
<!------------------panel-default end------------------------>
  





</div>
<!------------------panel-full-page end------------------------>
<div>
<div id="blanket" style="display:none;"></div>
<div id="popUpDiv" style="display:none;">

 <a href="#" onclick="initTime();popup('popUpDiv');" style="text-align: center; top:36%; color: white;margin-left: 20%; font-weight: bold; font-size: xx-large;" >Start Exam</a> 
</div>
</div>
 <div class="container">
<div>
 <div id="submitblack" style="display:none;"></div>
<div id="popsubmit" style="display:none;">
<p style="color: white;"></p>
  <a href="#" onclick="timeupsubmit()" style="text-align: center; color: white;margin-left: 33%;top: 36%; font-size: xx-large;font-weight: bold; " >Submit</a>
</div> 
</div>
</div>
<!------------------submit-alert-info--------------------------><!------------------submit-alert-info-------------------------->

 <div class="container">
 
  

  <!-- Modal -->
  <div class="modal fade" id="submitwarning" role="dialog" style="top:30%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" align="center" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Are You Sure You Want To Submit.</h4>
        </div>
        <div class="modal-body" align="center">
        <input type="submit" name="submit" value="Yes" id="finalsubmit" class="btn btn-success">
        </div>
        
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------submit-alert-info-end-------------------------><!------------------submit-alert-info-end------------------------>
<!------------------save-alert-info--------------------------><!------------------save-alert-info-------------------------->

 <div class="container">
 
  <!-- Trigger the modal with a button -->
  <input type="button" value="warning" id="savewarning" style="display: none;"    data-toggle="modal" data-target="#myModal">

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="top:30%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Please select anwser</h4>
        </div>
        <div class="modal-body">
        </div>
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------save-alert-info--------------------------><!------------------save-alert-info------------------------->


<!------------------profile-popup-info--------------------------><!------------------profile-popup-info-------------------------->

 <div class="container">
 
  <!-- Trigger the modal with a button -->
  <!-- <input type="button" value="warning" id="savewarning" style="display: none;"    data-toggle="modal" data-target="#myModal"> -->

  <!-- Modal -->
  <div class="modal fade" id="myModalProfile" role="dialog" style="top:1%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" style="background-image: url('images/background-image-header-instruction.jpg'); background-size: cover;  background-position: left;" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h5 class="modal-title"><img   src=" <% if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath"));} %>" class="img-circle"  width="110" height="110"><b style="color: #009999; font-size: x-large;">&nbsp;&nbsp;<%=request.getAttribute("Name") %>&nbsp; Profile</b></h5>
         
        </div>
        <div class="modal-body">
         <table class="table">
    
    <tbody>
      <tr class="success">
       
        <td>Student ID</td>
        <td><%=request.getAttribute("studId") %></td>
      </tr>
      <tr class="success">
        
        <td>Student Name</td>
        <td><%=request.getAttribute("Name") %></td>
      </tr>
      <tr class="success">
        
        <td>Student Username</td>
        <td><%=request.getAttribute("username") %></td>
      </tr>
      <tr class="success">
       
        <td>Subject</td>
        <td><%=request.getAttribute("subject") %></td>
      </tr>
      <tr class="success">
        
        <td>Collage Name</td>
        <td><%=request.getAttribute("college") %></td>
      </tr>
      <tr class="success">
        
        <td>Exam Duration (Minutes)</td>
        <td><%=request.getAttribute("time") %></td>
      </tr>
      <tr class="success">
       
        <td>Exam ID</td>
        <td><%=request.getAttribute("examId") %></td>
      </tr>
      <tr class="success">
        
        <td>Paper ID</td>
        <td><%=request.getAttribute("paperId") %></td>
      </tr>
      <tr class="success">
        
        <td>Subject ID</td>
        <td><%=request.getAttribute("subId") %></td>
      </tr>
    </tbody>
  </table> 
        </div>
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------profile-popup-info--------------------------><!------------------profile-popup-info------------------------->

<!------------------instruction-popup-info--------------------------><!------------------instruction-popup-info-------------------------->

 <div class="container">
 
  <!-- Trigger the modal with a button -->
  <!-- <input type="button" value="warning" id="savewarning" style="display: none;"    data-toggle="modal" data-target="#myModalInstruction"> -->

  <!-- Modal -->
  <div class="modal fade" id="myModalInstruction" role="dialog" style="top:10%; " >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header" style="background-image: url('images/background-image-header-instruction.jpg'); background-size: cover;  background-position: center;" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          <h5 class="modal-title"><img src="images/icon-instructions.png" class="img-circle"  width="50" height="50"><b style="color: #009999; font-size: x-large;">&nbsp;&nbsp;&nbsp;&nbsp;Instructions</b></h5>
          </div>
          <div class="modal-body" style="color: black;">
           <p class="text-primary">You have to write this exam in one sitting and no breaks are allowed in between </p>
  <p class="text-primary">If you have any doubt anywhere, please call the exam supervisor too seek possible assistance</p>
  <p class="text-primary">During the exam, do not read aloud either the questions or the answers </p>
  <p class="text-primary">You are not supposed to mishandle the computer equipment during the exam</p>
  <p class="text-primary">You can press <b> SUBMIT </b>button once you are done with the exam </p>
  <p class="text-primary">The exam would end automatically once the allowed duration is completed</p>
  <p class="text-primary">Please attempt all questions in the Exam</p>
  <p class="text-primary">You can review your answers during the exam and modify anytime </p>
  <p class="text-primary">There are no negative marks in the exam </p>
  <p class="text-primary">If any malpractice is noticed, the Exam supervisor has authority to stop your exam and may ask you to leave the exam center </p>
  <p class="text-primary">During the exam, you are not supposed to indulge in any other activities like discussing, disturbing others etc. </p>
        </div>
        
        
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------instruction-popup-info--------------------------><!------------------instruction-popup-info------------------------->


</form>
<!------------------form end-------------------------->

</div>
</body>
<!------------------body end------------------------>
</html>

 
 
 
 
 
 
 
 
 
 
 
 
 
 