<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="manipal.onlineexam.admin.entity.AuditTrail"%>
<%@page import="manipal.onlineexam.admin.dao.AuditTrailDao"%>
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
		StudentLoginDao loginDao=new StudentLoginDao();
		StudentLogin login=loginDao.getStudentLoginById(105);
		AuditTrailDao auditTrailDao=new AuditTrailDao();
		
		String auditT="MarkForClick-->31-->0-->Thu Aug 27 2015 17:13:01 GMT+0530 (India Standard Time)-->23,MarkForClick-->31-->0-->Thu Aug 27 2015 17:13:01 GMT+0530 (India Standard Time)-->23,MarkForClick-->31-->0-->Thu Aug 27 2015 17:13:01 GMT+0530 (India Standard Time)-->23";
		String[] sepAudit=auditT.split(",");
		if(sepAudit!=null)
		{
			for(String audit:sepAudit)
			{
				String[] events=audit.split("-->");
				
				AuditTrail auditTrail=new AuditTrail();
				//event
				if(events[0]!=null)
				{
					auditTrail.setEvent(events[0]);
				}
				//ques id
				if(events[1]!=null)
				{
					auditTrail.setqIdCentral(events[1]);
				}
				//option
				if(events[2]!=null)
				{
					auditTrail.setOption(events[2]);
				}
				//time
				if(events[3]!=null)
				{
					String temp="12-02-2015 17:13:01";
					 temp= temp.replaceAll(" GMT+0530 (India Standard Time)", "");
					SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
					

					try {

						Date date = formatter.parse(temp);
						System.out.println(date);
						System.out.println(formatter.format(date));
						auditTrail.setTime(date);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					
					
				}
				//user ques id
				if(events[4]!=null)
				{
					auditTrail.setqIdClient(events[4]);
				}
				
				auditTrailDao.addAuditTrail(auditTrail);
			}
		}
		
		
		
		%>

</body>
</html>