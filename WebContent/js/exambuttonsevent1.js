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
		para.setAttribute('class', 'btn btn-info');	
		
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
		
		
		//alert("Please select anwser.");
		//console.log("href..");
		 document.getElementById('savewarning').click();
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
		para.setAttribute('class', 'btn btn-success');	
		
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
	para.setAttribute('class', 'btn btn-warning');
	
	
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
			para.setAttribute('class', 'btn btn-default');
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
				if(bgColor!="btn btn-success" && bgColor!="btn btn-info")
					{
					clr.setAttribute('class', 'btn btn-warning');
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

	function chkSubmit() {
		
		var res=confirm("Are You Sure You Want To Submit.");
		return res;
		
	}	
	