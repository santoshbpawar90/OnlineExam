<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="manipal.onlineexam.util.QuestionClass"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--------------------------------------------css start------------------------------------>
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<!-- <link href="css/popuperror.css" rel="stylesheet" type="text/css" /> -->
<!--------------------------------------------css end------------------------------------>

<!--------------------------------------------script start------------------------------------>

     <!-----pop up---------------->   <script type="text/javascript" src="js/css-pop.js"></script>
     <!-----Full screen----------->   <script type="text/javascript" src="js/fullscreen2.js"></script>
     <!-----function Keys--------->   <script type="text/javascript" src="js/disablekeys.js"> </script>
      <script type="text/javascript" src="js/disableControlCombination.js">  </script> 
     
     
     <script type="text/javascript">
     
   
     var AuditArr=[];
     function auditTrail()
     {
     	
     
     	var	qid=document.getElementById("hdnQId"+prevId).value;
     	//alert("actual qution id---"+qid);
     	
     var op=document.getElementsByName("option"+prevId);
     	var tempVal=0;
     	 if(op!=null)
     		{
     		
     		for(var i=0;i<op.length;i++)
     			{
     				if(op[i].checked==true)
     				{
     					//alert("option checked=="+op[i].value);
     					tempVal=op[i].value;
     					
     					
     					break;
     				}
     			}
     		}
     		
     		var time=document.getElementsByName("option").innerHTML = Date(); 
     		//alert(time);
     	
     		var con=("  || Question -->  ")+qid.concat("  Ans -->  "+tempVal," Time -->  "+time);
     		//alert(con);
     		
     		// var AuditArr=[];
     		 AuditArr.push(con);
     		 
     		var insert= document.getElementsByName("option"+prevId).innerHTML = AuditArr;
     		 // alert(insert);
     		 
     		console.log(insert);
     	}
     
     
     
     </script>

<script>

function timeupsubmit(){
	
	document.getElementById('submitbutton').click();
	
}

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




var seconds = 60 ;

function calRes(){
	
	
var arrQuOp=[[],[]];	
	
var	totalquestion=document.getElementById('count').value;
for(var i=1;i<=totalquestion;i++){
	var qId=document.getElementById("hdnQId"+i).value;
	var op=document.getElementsByName("option"+i);
	if(op!=null)
	for(var j=0;j<op.length;j++)
		{
			if(op[j].checked==true)
			{
				console.log(i+"=> q="+ qId+", option checked=="+op[j].value);	
				if(qId!="" && qId!=0 && op[j].value!="" )
				arrQuOp.push(qId,op[j].value);
				break;
			}
		}
	//alert("Are you sure you want to submit exam ?")
	console.log("array"+arrQuOp);
	document.getElementById("finalanwser").value=arrQuOp;
	
	/* document.examForm.action="../../StudentSubmitServlet";
	document.examForm.submit();  */
}


	
}

function profilrpopup(){
	var myWindow = window.open("", "", "left=500,top=200 ,width=300 , height=300 , scrollbars=yes");
	var uname=document.getElementById("username").value;
	var subject=document.getElementById("subject").value;
	var college=document.getElementById("college").value;
	var time=document.getElementById("timegiven").value;
	var examId=document.getElementById("examId").value;
	var paperId=document.getElementById("paperId").value;
	var subId=document.getElementById("subId").value;
	var studId=document.getElementById("studId").value;
	
	
	
	
	myWindow.document.write("<div> <table ><tr><td>Student Id:</td>&nbsp;<td>"+studId.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>Username:</td>&nbsp;<td>"+uname.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>subject:</td>&nbsp;<td>"+subject.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>College:</td>&nbsp;<td>"+college.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>Total Time:</td>&nbsp;<td>"+time.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>Exam Id:</td>&nbsp;<td>"+examId.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>Paper Id:</td>&nbsp;<td>"+paperId.fontcolor("green")+"</td></tr>");
	myWindow.document.write("<tr><td>Subject Id:</td>&nbsp;<td>"+subId.fontcolor("green")+"</td></tr></table></div>");
	
	
}

function questionpopup(dname) {
  
}

var prevId=0;
function markandreview(){

	
	console.log("prevId="+prevId);
	if(prevId==0)
	{
		prevId=1;
	}
	var para=document.getElementById("btn"+prevId);	
	if(para!=null)
	{
		para.setAttribute('class', 'btnper');	
		
		saveQidOption('mark');
	}
	
	
	if(document.getElementById(prevId)!=null)
	{
		document.getElementById(prevId).style.display = "none";
	}	
			
		  prevId=parseFloat(prevId)+1;
		  var temp=document.getElementById(prevId);
		  if(temp!=null)
			  {
			  temp.style.display = "block";	  
			  
			  }

			console.log("prev="+prevId);
		  var count= document.getElementById("count");
		  
		  if(count!=null)
			 {
			  var c=parseFloat(count.value)+1;
			  console.log("count.value="+c);
			 
			 	if(prevId==c)
			 		{
			 			prevId=1;
			 			  var temp1=document.getElementById(prevId);
			 			  if(temp1!=null)
			 				  {
			 				  temp1.style.display = "block";	  
			 				  
			 				  }
			 		}
			  }
	
	
	
}

function saveQidOption(callFrom){
	console.log("prevId="+prevId+" Call from="+callFrom);
	if(prevId==0)
	{
		prevId=1;
	}
	var	qid=document.getElementById("hdnQId"+prevId).value;
	console.log("actual qution id---"+qid);
	
	var flag=false;
	var tempVal=0;
	var op=document.getElementsByName("option"+prevId);
	console.log("val="+op);
	if(op!=null)
		{
		
		for(var i=0;i<op.length;i++)
			{
				if(op[i].checked==true)
				{
					console.log("option checked=="+op[i].value);
					tempVal=op[i].value;
					flag=true;
					break;
				}
			}
		
		
		}
	
	if(flag==false && callFrom!="mark")
		{
		alert("Please select anwser.");
		//console.log("href..");
		 //document.getElementById('myHref').click();
		}
	else if(callFrom=="save")
		{
		savenext();
		}
	
		
}


function savenext(){
	console.log("prevId="+prevId);
	if(prevId==0)
	{
		prevId=1;
	}
	var para=document.getElementById("btn"+prevId);	
	if(para!=null)
	{
		para.setAttribute('class', 'btngrn');	
		
		saveQidOption();
	}
	
	
	if(document.getElementById(prevId)!=null)
	{
		document.getElementById(prevId).style.display = "none";
	}		
		  prevId=parseFloat(prevId)+1;
		  var temp=document.getElementById(prevId);
		  if(temp!=null)
			  {
			  temp.style.display = "block";	  
			  
			  }

			console.log("prev="+prevId);
		  var count= document.getElementById("count");
		  
		  if(count!=null)
			 {
			  var c=parseFloat(count.value)+1;
			  console.log("count.value="+c);
			 
			 	if(prevId==c)
			 		{
			 			prevId=1;
			 			  var temp1=document.getElementById(prevId);
			 			  if(temp1!=null)
			 				  {
			 				  temp1.style.display = "block";	  
			 				  
			 				  }
			 		}
			  }
	
	
}


function clearR(){

	console.log("prevId="+prevId);
	if(prevId==0)
	{
		prevId=1;
	}
	var para=document.getElementById("btn"+prevId);	
	para.setAttribute('class', 'btnred');
	
	
	var	qid=document.getElementById("hdnQId"+prevId).value;
	console.log("actual qution id---"+qid);
	
	var flag=false;
	var tempVal=0;
	var op=document.getElementsByName("option"+prevId);
	console.log("val="+op);
	if(op!=null)
		{
		
		for(var i=0;i<op.length;i++)
			{
				if(op[i].checked==true)
				{
					op[i].checked=false;
					console.log("option checked=="+op[i].value);
					tempVal=op[i].value;
					flag=true;
					break;
				}
			}
		
		
		}
	
	
}

/* var tim;

var min=0;
console.log("time--"+min)
var sec = 60;
var f = new Date();
 function f1() {
	 if(document.getElementById("timegiven")!=null)
		{
			min=document.getElementById("timegiven").value;	
		}
	console.log("min="+min);
    f2(min);
    document.getElementById("starttime").innerHTML = "Your started your Exam at " + f.getHours() + ":" + f.getMinutes();
     
  
} 


function f2(min) {
	
    if (parseInt(sec) > 0) {
        sec = parseInt(sec) - 1;
        document.getElementById("showtime").innerHTML = "Your Left Time  is :"+min+" Minutes ," + sec+" Seconds";
        tim = setTimeout("f2()", 1000);
    }
    else {
        if (parseInt(sec) == 0) {
            min = parseInt(min) - 1;
            if (parseInt(min) == 0 && parseInt(sec)==0)
            	{
            	 popup('popsubmit');
            	}          
            else if (parseInt(min) == 0) {
                clearTimeout(tim);
                location.href = "default5.aspx";
            }
            else {
                sec = 60;
                document.getElementById("showtime").innerHTML = "Your Left Time  is :" + min + " Minutes ," + sec + " Seconds";
                tim = setTimeout("f2()", 1000);
            }
        }
       
    }
}
 */

 var countdownTimer =null;
function initTime() {
	var	totalMinuteGivenByAdmin=document.getElementById("timegiven").value;
	console.log("totalminutegivenbyadmin=="+totalMinuteGivenByAdmin);
	seconds=seconds*parseFloat(totalMinuteGivenByAdmin);
	 countdownTimer = setInterval('timer()', 1000);
	//timer();
	
}

function timer() {
	
	
	
	
    var minutes = Math.round((seconds - 30)/60);
    var remainingSeconds = seconds % 60;
    if (remainingSeconds < 10) {
        remainingSeconds = "0" + remainingSeconds;  
    }
    document.getElementById("time").innerHTML = minutes + ":" + remainingSeconds;
    
    if (remainingSeconds == 0 && minutes==0) {
    	
        clearInterval(countdownTimer);
        popup('popsubmit');
    } else {
        seconds--;
    }
}


 
 

	function start() {
		var totalQuestion = document.getElementById("count").value;
		for (var i = 1; i <= totalQuestion; i++) {
			var para = document.createElement("input");
			para.type = "button";
			para.style = "width: 35px;height: 30px;"
			para.value = i;
			para.id = i;
			para.setAttribute('onclick', 'clickButton(this.value)');
			para.setAttribute('class', 'btnwhite');
			para.setAttribute('id', 'btn'+i);
			document.getElementById("questionMenu").appendChild(para);
			document.getElementById("questionMenu").innerHTML += '   ';

			
		}

	}
	function clickButton(id) {
		console.log("prevId="+prevId);

		if(prevId==0)
		{
			prevId=1;
		}
		if(document.getElementById(prevId)!=null)
		{
			document.getElementById(prevId).style.display = "none";	
			
			var clr	=document.getElementById("btn"+prevId);
			console.log("clr="+clr);
			if(clr!=null)
			{
				var bgColor=clr.className;
				console.log("bgColor="+bgColor);
				if(bgColor!="btngrn" && bgColor!="btnper")
					{
					clr.setAttribute('class', 'btnred');
					}
				
			} 
		}
		
		document.getElementById(id).style.display = "block";
		prevId=id;
		
	}
	
	function instructionpopup(){
		var txt="Please read the following instructions carefully.....";
		var txt1="All the best for your exam!!";
		
		var myWindow = window.open("", "", "left=200,top=10 ,width=900 , height=700 , scrollbars=yes,text-align: center");
		myWindow.document.write("<div font-family: Arial, Helvetica, sans-serif >");
		myWindow.document.write("<p>" + txt.fontsize(5) + "</p>");
		myWindow.document.write("<p>1.	You have to write this exam in one sitting and no breaks are allowed in between</p>");
		myWindow.document.write("<p>2.	If you have any doubt anywhere, please call the exam supervisor too seek possible assistance</p>");
		myWindow.document.write("<p>3.	During the exam, do not read aloud either the questions or the answers</p>");
		myWindow.document.write("<p>4.	You are not supposed to mishandle the computer equipment during the exam</p>");
		myWindow.document.write("<p>5.	You can press SUBMIT button once you are done with the exam</p>");
		myWindow.document.write("<p>6.	The exam would end automatically once the allowed duration is completed</p>");
		myWindow.document.write("<p>7.	Please attempt all questions in the Exam.</p>");
		myWindow.document.write("<p>8.	You can review your answers during the exam and modify anytime</p>");
		myWindow.document.write("<p>9.	There are no negative marks in the exam</p>");
		myWindow.document.write("<p>10.	If any malpractice is noticed, the Exam supervisor has authority to stop your exam and may ask you to leave the exam center</p>");
		myWindow.document.write("<p>11.	During the exam, you are not supposed to indulge in any other activities like discussing, disturbing others etc.</p>");
		myWindow.document.write("<p>" + txt1.fontsize(5) + "</p>");
		

	}

	
	
</script>

<!--------------------------------------------script end------------------------------------>
<head>
<style>
<!------------------------------------popuperror start--------------------------------------->
body {
  font-family: Arial, sans-serif;
  background: url(4.jpg);
  background-size: cover;
}

h1 {
  text-align: center;
  font-family: Tahoma, Arial, sans-serif;
  color: orange;
  margin: 100px 0;
}

.box {
  width: 20%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}

.button {
  font-size: 1em;
  padding: 10px;
  color: #fff;
  border: 2px solid orange;
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  background: orange;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popuperror {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popuperror h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popuperror .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popuperror .close:hover {
  color: orange;
}
.popuperror .content {
  max-height: 30%;
  overflow: auto;
}
<!------------------------------------popuperror end--------------------------------------->
div.fixedheder {
border-radius: 15px;
     position: fixed;
    top: 0%;
    left: 0%;
    width: 100%;
    height:10%;
    border: 3px solid #606060;"
}
div.fixedmain {
border-radius: 15px;
background-color:#F0F0F0;
     position: fixed;
    top: 11%;
    left: 0.5%;
    width: 69.5%;
    height:73.7%;
    border: 2px solid #606060;"
}
div.fixedmenu {
border-radius: 15px;
     position: fixed;
    bottom:0.5%;
    right: 0.5%;
    width: 29%;
    height:88%;
    border: 2px solid #606060;"
}
div.fixedfooter {
     border-radius: 15px;
    position: fixed;
    bottom: 0.5%;
    left: 0.5%;
    width: 69.5%;
    height:14%;
    border: 2px solid #606060;
}

.btnper {
 background: #d9a8fa;
  background-image: -webkit-linear-gradient(top, #d9a8fa, #76497d);
  background-image: -moz-linear-gradient(top, #d9a8fa, #76497d);
  background-image: -ms-linear-gradient(top, #d9a8fa, #76497d);
  background-image: -o-linear-gradient(top, #d9a8fa, #76497d);
  background-image: linear-gradient(to bottom, #d9a8fa, #76497d);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #ffffff;
  font-size: 16px;
  padding: 6px 6px 6px 6px;
  text-decoration: none;
    font-weight:bolder;
}

.btngrn {
background: #84fa84;
  background-image: -webkit-linear-gradient(top, #84fa84, #408c67);
  background-image: -moz-linear-gradient(top, #84fa84, #408c67);
  background-image: -ms-linear-gradient(top, #84fa84, #408c67);
  background-image: -o-linear-gradient(top, #84fa84, #408c67);
  background-image: linear-gradient(to bottom, #84fa84, #408c67);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #fff7ff;
  font-size: 16px;
  padding: 6px 6px 6px 6px;
  text-decoration: none;
    font-weight:bolder;
}

.btnwhite {
  background: #008db8;
  background-image: -webkit-linear-gradient(top, #008db8, #80f5f5);
  background-image: -moz-linear-gradient(top, #008db8, #80f5f5);
  background-image: -ms-linear-gradient(top, #008db8, #80f5f5);
  background-image: -o-linear-gradient(top, #008db8, #80f5f5);
  background-image: linear-gradient(to bottom, #008db8, #80f5f5);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #000000;
  font-size: 16px;
  padding: 6px 8px 6px 8px;
  text-decoration: none;
    font-weight:bolder;
}
.btnred {
 background: #ffcccc;
  background-image: -webkit-linear-gradient(top, #ffcccc, #ffa1a1);
  background-image: -moz-linear-gradient(top, #ffcccc, #ffa1a1);
  background-image: -ms-linear-gradient(top, #ffcccc, #ffa1a1);
  background-image: -o-linear-gradient(top, #ffcccc, #ffa1a1);
  background-image: linear-gradient(to bottom, #ffcccc, #ffa1a1);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #000000;
  font-size: 16px;
  padding: 6px 8px 6px 8px;
  text-decoration: none;
    font-weight:bolder;
}
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
  font-size: 16px;
  padding: 6px 8px 6px 8px;
  font-weight:bolder;
  
  }

.btn:hover {
  text-decoration: none;
}
p.qbox{
    border-style: dotted;
    border-width: 1px;
  
}
</style>
    
   
    <script type="text/javascript">
    	function chkSubmit() {
    		
    		//var res=confirm("Are You Sure You Want To Submit.");
    		var res=true;
    		return res;
			
		}
    </script>   


</head>
<body onload="start();popup('popUpDiv')"  onkeypress="return disableCtrlKeyCombination(event);" onkeydown="return disableCtrlKeyCombination(event);">
<form name="examForm" id="examForm" onmousemove="changeHashOnLoad();" method="post" action="StudentSubmitServlet" onsubmit="return chkSubmit()">
<!--------------------------------------------outer most div start------------------------------------>
<div  class="outermost" style=" border-radius: 25px;  position: fixed;height:98.5% ;width:99%; top:0%;left: 0%; font-family: Arial, Helvetica, sans-serif;" >

<!--------------------------------------------header start-------------------------------------------->

<div style="border-radius: 15px;
     position: fixed;
    top: 0.5%;
    left: 0.5%;
    width: 98.8%;
    height:10%;
    border: 2px solid #606060;">
<br>
<img src="images/ManipalTechnologieslogo.png" style="position: fixed;height:9% ; top:1.5%;left: 4%; " >

<div style="position: fixed; top:4%; left: 80%; ">Time Left:&nbsp; <span id="time" style="color: red;"></span></div>

</div>
<!--------------------------------------------header end------------------------------------>

<!--------------------------------------------main start------------------------------------>
<div class="fixedmain">
<br>

<br>
<br>

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

<input id="op<%=count %>" type="radio" name="option<%=count %>" value="1" onclick="auditTrail()">
 <%=ques.getOption1() %>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
B.&nbsp;&nbsp;&nbsp;						
<input id="op<%=count %>" type="radio"  name="option<%=count %>" value="2" onclick="auditTrail()">
 <%=ques.getOption2() %>
						</td>
						</tr>
						<tr>
						
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
C.&nbsp;&nbsp;&nbsp;						
<input id="op<%=count %>" type="radio" name="option<%=count %>" value="3" onclick="auditTrail()">
 <%=ques.getOption3() %>
						</td>
						</tr>
					    <tr>
					  
						<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
D.&nbsp;&nbsp;&nbsp;					
<input id="op<%=count %>" type="radio" name="option<%=count %>" value="4" onclick="auditTrail()">
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

<!--------------------------------------------main end------------------------------------>


<!--------------------------------------------manu start------------------------------------>

<div class="fixedmenu" id="Menu">
<br>


<div class="timeandinfo" id="personInfo" >

<table border="1" style="border-spacing: 1px;" width="100%">

<tr>

<td align="center"><% if(request.getAttribute("photoPath")!=null && !request.getAttribute("photoPath").equals("null") ){ out.print(request.getAttribute("photoPath"));} %>

</td>
<td> <table>
	<tr>
		<td><%=request.getAttribute("studId") %> </td>
		
	</tr>
	<tr>
		
		<td><%=request.getAttribute("Name") %></td>
		
	</tr>
	
	
</table> </td>
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
<br>



<!-- 
       <div id="starttime"></div>
 
       <div id="endtime"></div>
 
       <div id="showtime"></div> -->



</div>
<h4 style="font-weight: bold; color: blue;">&nbsp;&nbsp;&nbsp;Question Palette:</h4>

<div class="questionbutton" id="questionMenu" style="padding: 5%;height:25%;overflow: scroll;">


</div>
<hr>
<div class="instructionbutton" style="padding: 2%; height:25%; font-family: Arial, Helvetica, sans-serif;">

<table >

<tr>

<td>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btngrn" style="width: 28px;height: 28px;"></button></td> 
<td>&nbsp;Answered
</td>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btnred" style="width: 28px;height: 28px;" ></button>
</td>
<td>&nbsp;Not Answered
</td>

</tr>

<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btnper" style="width: 28px;height: 28px;"></button>
</td>
<td>&nbsp;Marked 
</td>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btnwhite" style="width: 28px;height: 28px;"></button>
</td>
<td>&nbsp;Not Visited
</td>
</tr>
</table>
<br>
<br>
<table>
<tr>

<!-- <input type="button" class="btn" value="Question Paper" onclick="questionpopup()"> -->
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn" value="Profile" onclick="profilrpopup()" >
</td>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn" value="Instructions" onclick="instructionpopup()" >
</td>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn" value="Submit" onclick="calRes();auditTrail();" id="submitbutton">
</td>

</tr>
</table>

</div>


</div>

<!--------------------------------------------manu end------------------------------------>



<!--------------------------------------------footer start------------------------------------>


<div class="fixedfooter"> 

<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn" value="Clear Response" onclick="clearR()" >

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn" value="Mark for Review & Next" onclick="markandreview();auditTrail()" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn" value="Save & Next" onclick="saveQidOption('save');auditTrail()">
<br>
<!-- <div class="box">
	<a class="button" id="myHref" style="display: none;" href="#popuperror1"></a>
</div> -->
</div>
<!--------------------------------------------footer end------------------------------------>








<div>
<div id="blanket" style="display:none;"></div>
<div id="popUpDiv" style="display:none;">

  <a href="#" onclick="initTime();popup('popUpDiv');fullScreenApi.requestFullScreen(document.documentElement);" style="text-align: center; top:36%; color: white;margin-left: 20%; font-weight: bold; font-size: xx-large;" >Start Exam</a>
</div>
</div>
<div>
 <div id="submitblack" style="display:none;"></div>
<div id="popsubmit" style="display:none;">
<p style="color: white;"></p>
  <a href="#" onclick="timeupsubmit()" style="text-align: center; color: white;margin-left: 33%;top: 36%; font-size: xx-large;font-weight: bold; " >Submit</a>
</div> 
</div>	



<!-- <div id="popuperror1" class="overlay">
	<div class="popuperror">
		
		<a class="close" href="#">×</a>
		<div class="content">
			Please select the anwser.
		</div>
	</div>
</div> -->
</div>

<!--------------------------------------------outer most div end------------------------------------>
 
 </form>
</body>
</html>