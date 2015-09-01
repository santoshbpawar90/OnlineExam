<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="manipal.onlineexam.util.QuestionClass"%>
<!DOCTYPE html |>
<html  style="height: 97%; ">
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

.numberCircle {
    border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 45px;
    height: 45px;
    padding: 8px;

    background: #fff;
   
    color: #666;
    text-align: center;

    font: 32px Arial, sans-serif;
}


.label-text {
    background-color: white;
    font-size:small;
    padding: 2px 5px 2px 5px;
    border-radius: 10px;
}
<!----------------------------------profile start------------------------------------------->
.profile-header-container{
   
}

.profile-header-img {
  
}

.profile-header-img {
    
}

.profile-header-img > img.img-circle {
    width: 120px;
    height: 120px;
    border: 2px solid #51D2B7;
}

.profile-header {
    
}


.label.label-default.rank-label {
    background-color: #3399FF;
    padding: 5px 10px 5px 10px;
    
}
.label.label-default.rank-label-name {
    background-color: #3399FF;
    padding: 5px 10px 5px 10px;
    border-radius: 20px;
}
<!----------------------------------profile end--------------------------------------------->
</style>

<script>
$(document).ready(function(){
		$("#divmain").css({<%=request.getAttribute("DivMain")%>});
		$("#divmenu").css({<%=request.getAttribute("DivMenu")%>});
});
</script>


</head>
<!------------------body start------------------------>
<body style=" height: 100%;" onload="start();popup('popUpDiv')">


<div style="border: solid 1px;height: auto;width: 100%;"> 

<!------------------form start------------------------>
<form  style="height: 100%" method="post" action="StudentSubmitServlet" >
<!------------------panel-full-page start------------------------>
<div class="container-fluid" style="height: 100%;" >





<!------------------panel-default start------------------------>
<div class="panel panel-default col-md-9 col-sm-6 col-xs-6 " style="padding: 0%;height: 99%;overflow: scroll; " id="divmain">
<!------------------panel-heading start------------------------>
<div class="panel-heading col-md-12" style=" padding-left: 1%; background-image: url('images/head-exam.jpg'); background-size: cover;  ">
<div class="panel-title col-md-10"><img src="images/icons-online-exam.jpg" class="img-circle"  width="80" height="75"><b style="color: #009999; font-size: xx-large;">&nbsp;&nbsp;<%=request.getAttribute("examName")%></b></div>
<div class="panel-instruction col-md-2" style="padding: 1%;">
<input type="hidden" class="btn btn-info btn-sm" value="Instructions" data-toggle="modal" data-target="#myModalInstruction" onclick="save(this);" id="InstructionClick">

</div>
</div>
 <!------------------panel-body start------------------------>
 <div class="panel-body" style="display: block; height: 76%;" >
 
 <!---------------------------panel-question-anwser start------------------------------->
 <div class="panel-question-anwser" style="height: 450px;overflow: auto;">
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
 <div class="panelfooter "  style=" border: 1px #e4e4e4 solid;  bottom: 15px; " >
  <!-------------------------panel-question-buttons start--------------------------------->
  <div class="panel-question-buttons" style="padding: 15px;float: left;">

<input type="button" class="btn btn-success" value="Clear Response" onclick="clearR();save(this);" id="ClearResponseClick" >
<input type="button" class="btn btn-success" value="Mark for Review" onclick="markandreview();save(this);" id="MarkNReviewClick" >
<input type="button" class="btn btn-success" value="Save" onclick="saveQidOption('save');save(this);" id="SaveClick">
  

 </div>
 <!---------------------------panel-question-buttons end------------------------------->
 
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
 <!------------------container start------------------------>
<div class="container">

 <!------------------panel-default start------------------------>
<div class="panel panel-info col-md-3 col-sm-6 col-xs-6" style="height: 99%; padding: 0%;overflow: auto;" id="divmenu" >
 <!------------------panel-body-menu start------------------------>
 <div class="panel-heading " style="height:100%;  ">
 
 <!---------------------------panel-timer start------------------------------->
 <table  style="width: 100%; border-color:green; padding:5px; " >
 
 <tr>
   <td >
   <div class="label-text"  align="center" style="height:30px;">
    
 <font style="font-size: large;"> Time Left:&nbsp; <span id="time" style="color: red;"></span></font>
 </div> 
</td> 
</tr>
 <!----------------------------panel-timer end------------------------------>
 <!----------------------------panel-student-info start------------------------------>
 
 <tr>
 <td >
 <div class="panel-student-info " style="position:relative;  height:10%; ">
 
 

        <div class="profile-header-container " style="border: 1px solid;
border-radius: 15px; border-color: gray; margin-top: 2px;">
        
          <table  style="width: 100%; height: 100%; margin-top: 4px;margin-bottom: 4px; ">
          <tr>
          <td align="center">
    		<div class="profile-header-img ">
                <img style="border:solid 1px; " class="img-rounded" height="120" width="100" src="<% if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath").toString().trim());} %>" />
                <!-- badge -->
                
            </div>
          </td>  
            <td>
            <table   style="width: 100%; height: 100%;">
            <tr>
            <td  >
            <div style="" class="rank-label-container-id " align="left">
                    <span class="label label-default rank-label"><%=request.getAttribute("studId") %></span>
                </div>
                </td>
                
                <td align="center" valign="top" >
                <img title="View your profile" alt="View your profile" data-toggle="modal" data-target="#myModalProfile" onclick="save(this);" id="ProfileClick" style="border:solid 1px;  background-position: center;" class="img-circle" height="30" width="30" src="images/icon-profile-button.png"/>
                </td>
               </tr>
               
               <tr>
               <td style="" align="left">
                <div class="rank-label-container-name ">
                    <span class="label label-default rank-label"><%=request.getAttribute("Name") %></span>
                </div>
                </td>
            </tr>
            <tr>
            <td style="padding: 4%; " align="left">
             <input type="hidden"  class="btn btn-info btn-sm " value="Profile" data-toggle="modal" data-target="#myModalProfile" onclick="save(this);" id="ProfileClick">  
			</td>
 			</tr>
 			</table>
  			</td>   
      		</tr>
       </table>
        </div> 
 

 
 
<div><span><input type="hidden" name="username"   id="username"  value="<%=request.getAttribute("username") %>" readonly="readonly" ></span></div>
<div><span><input type="hidden" name="subject"    id="subject"   value="<%=request.getAttribute("subject") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="college"    id="college"   value="<%=request.getAttribute("college") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="timegiven"  id="timegiven" value="<%=request.getAttribute("time") %>"     readonly="readonly" ></span></div>
<div><span><input type="hidden" name="examId"     id="examId"    value="<%=request.getAttribute("examId") %>"   readonly="readonly" ></span></div>
<div><span><input type="hidden" name="paperId"    id="paperId"   value="<%=request.getAttribute("paperId") %>"  readonly="readonly" ></span></div>
<div><span><input type="hidden" name="subId"      id="subId"     value="<%=request.getAttribute("subId") %>"    readonly="readonly" ></span></div>
<div><span><input type="hidden" name="studId"     id="studId"    value="<%=request.getAttribute("studId") %>"   readonly="readonly" ></span></div>
<div><span><input type="hidden" name="uId"        id="uId"       value="<%=request.getAttribute("uId") %>"      readonly="readonly" ></span></div>	       
<div><span><input type="hidden" name="finalanwser"id="finalanwser" value=""></span></div>       
	       
 </div>
 </td>
 </tr> 
 <!----------------------------panel-student-info end------------------------------>
 <!--------------------------panel-question-palette start-------------------------------->
 <tr >
 <td >
  <div class="panel-question-palette" style="height:190px; border: 1px solid;
border-radius: 15px; margin-top: 2px; border-color: gray;" >
  
  <font color="gray"  style="font-size:small; padding-left: 4px;">Question Palette :</font>
  
<div class="questionbutton" id="questionMenu" onclick="save(this);" style="padding: 2%;width:100%; height:80% overflow-y: scroll; ">
</div>
 </div>
 </td>
 </tr>
  <!-------------------------panel-question-palette end---------------------------------> 
 <!---------------------------panel-menu-buttons start------------------------------->
 
 
 
 <tr>
 <td>
 
 <div class="panel-menu-buttons" >
 <font color="gray"  style="font-size:small; padding-left: 4px;">Legends :</font>
 <table >
 
 <tr>
 <td>
 <div class="numberCircle"><button type="button" class="btn btn-success" style="width: 28px;height: 28px;"></button></div>
 </td>

 <td>
 <div class=" label-text">Answered</div>
</td>
</tr>

<tr>
 <td>
 <div class="numberCircle"><button type="button" class="btn btn-warning" style="width: 28px;height: 28px;"></button></div>
 </td>

 <td>
 <div class=" label-text">Not Answered</div>
</td>
</tr>

<tr>
 <td>
 <div class="numberCircle"><button type="button" class="btn btn-info" style="width: 28px;height: 28px;"></button></div>
 </td>

 <td>
 <div class=" label-text">Marked</div>
</td>
</tr>
  
<tr>
 <td>
 <div class="numberCircle"><button type="button" class="btn btn-default" style="width: 28px;height: 28px;"></button></div>
 </td>

 <td>
 <div class=" label-text">Not Visited</div>
</td>
</tr> 




 </table>
 
 </div>
 </td>
 </tr>
  <tr>
 <td align="center">
 



<div style=" bottom: 10px; ">
<input type="button" class="btn btn-success" value="Submit" data-toggle="modal" data-target="#submitwarning"   id="submitbutton">
</div>
</td>
</tr>
 
 
 

 <!---------------------------panel-menu-buttons end------------------------------->
</table>
 </div>
 <!------------------panel-body-menu end------------------------> 

  </div>
<!------------------panel-default end------------------------>
  
</div>
 <!------------------container end------------------------>



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
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
          <h4 class="modal-title">You have some unanswered questions. Do you wish to continue or end the exam?</h4>
          <h4 class="modal-title">Do you wish to continue or end the exam?</h4>
        </div>
        <div class="modal-body" align="center">
        <input type="submit" name="submit" value="Ok" id="finalsubmit" class="btn btn-success">
        <input type="button"  data-dismiss="modal"  value="Cancel" id="finalsubmit" class="btn btn-warning ">
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
         <h5 class="modal-title"><img   src=" <%if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath"));}%>" class="img-rounded"  width="110" height="110"><b style="color: #009999; font-size: x-large;">&nbsp;&nbsp;<%=request.getAttribute("Name") %>&nbsp; Profile</b></h5>
         
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
           <p class="text-primary">You have to write this exam in one sitting. No breaks are allowed.</p>
  <p class="text-primary">In case of doubts, please call the exam supervisor to seek assistance.</p>
  <p class="text-primary">During the exam, do not read out the questions/answers loudly.</p>
  <p class="text-primary">Do not mishandle any computer equipment during the exam.</p>
  <p class="text-primary">Press <b> SUBMIT </b>button once you have completed the exam.</p>
  <p class="text-primary">The exam would end automatically once duration exceeds.</p>
  <p class="text-primary">All questions are compulsory.</p>
  <p class="text-primary">You can review and modify your answers during the exam. </p>
  <p class="text-primary">There is no negative marks for the questions.</p>
  <p class="text-primary">The Exam supervisor has the authority to stop your exam and may ask you to leave the examination center in case any malpractice is detected.</p>
  <p class="text-primary">Do not indulge in activities like discussing, disturbing others etc.</p>
        </div>
        
        
       
      </div>
      
    </div>
  </div>
  
</div>

<!------------------instruction-popup-info--------------------------><!------------------instruction-popup-info------------------------->


</form>

</div>

<!------------------form end-------------------------->


</body>
<!------------------body end------------------------>
</html>

