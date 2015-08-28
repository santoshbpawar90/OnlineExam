<%@page import="manipal.onlineexam.admin.dao.TrailDao"%>
<%@page import="manipal.onlineexam.admin.entity.Trail"%>

<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	
	
		String trail="";
		if(request.getParameter("trail")!=null)
		{
			trail=request.getParameter("trail").trim();
		}
		
		
		
		
		 TrailDao trailDao=new TrailDao();
		
		
		
		
			
				String[] events=trail.split("-->");
				
				 Trail trailO=new Trail();
				//event
				if(events[0]!=null)
				{
					trailO.setMyEvent(events[0]);
				}
				//ques id
				if(events[1]!=null)
				{
					trailO.setqIdCentral(events[1]);
				}
				//option
				if(events[2]!=null)
				{
					trailO.setOptionNo(events[2]);
				}
				//time
				if(events[3]!=null)
				{
					String temp=events[3];
					 temp= temp.replaceAll(" GMT+0530 (India Standard Time)", "");
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					

					try {

						Date date = formatter.parse(temp);
						System.out.println(date);
						System.out.println(formatter.format(date));
						trailO.setMyDate(date);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					
					
				}
				//user ques id
				if(events[4]!=null)
				{
					trailO.setqIdClient(events[4]);
				}
				
				
				if(events[5]!=null)
				{
					StudentLoginDao loginDao=new StudentLoginDao();
					StudentLogin login=loginDao.getStudentLoginById(Integer.parseInt(events[5]));
					
					trailO.setStudentLogin(login);
				}
				
				
				
				
				 trailDao.addTrail(trailO);
			
		
		
		
		
		%>

</body>
</html>