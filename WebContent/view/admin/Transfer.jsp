<%@page import="manipal.onlineexam.admin.dao.TrailDao"%>
<%@page import="manipal.onlineexam.admin.entity.Trail"%>
<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="java.util.List"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="org.w3c.dom.Attr"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.transform.TransformerException"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.net.Socket"%>
<%@page import="java.net.ServerSocket"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
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
try
{

	
	StudentLoginDao studentLoginDao=new StudentLoginDao();
	
	List<StudentLogin> studentLogins=studentLoginDao.getAllStudentLogins();
	
	
	DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
	
	Document doc = docBuilder.newDocument();
	Element rootElement = doc.createElement("ExamDetails");
	doc.appendChild(rootElement);
	
	for(StudentLogin studentLogin:studentLogins)
	{
		
	
	Element student = doc.createElement("StudentId");
	rootElement.appendChild(student);	
	
	
	// set attribute to staff element
			Attr attr = doc.createAttribute("id");
			attr.setValue(studentLogin.getStudId());
			student.setAttributeNode(attr);
			
			
			Element studentDetails = doc.createElement("StudentDetails");
			student.appendChild(studentDetails);
	
				Element StudentId = doc.createElement("StudentId");
				StudentId.appendChild(doc.createTextNode(studentLogin.getStudId()));
				studentDetails.appendChild(StudentId);
				
				Element StudentName = doc.createElement("StudentName");
				StudentName.appendChild(doc.createTextNode(studentLogin.getStudName()));
				studentDetails.appendChild(StudentName);
				
				Element ExamId = doc.createElement("ExamId");
				ExamId.appendChild(doc.createTextNode(studentLogin.getPack().getExamId()));
				studentDetails.appendChild(ExamId);
				
				
				Element ExamName = doc.createElement("ExamName");
				ExamName.appendChild(doc.createTextNode(studentLogin.getPack().getqPackName()));
				studentDetails.appendChild(ExamName);
				
				Element PaperId = doc.createElement("PaperId");
				PaperId.appendChild(doc.createTextNode(studentLogin.getPack().getPaperId()));
				studentDetails.appendChild(PaperId);
				
				/* Element PaperName = doc.createElement("PaperName");
				PaperName.appendChild(doc.createTextNode("1"));
				studentDetails.appendChild(PaperName); */
				
				
				Element subjectid = doc.createElement("subjectid");
				subjectid.appendChild(doc.createTextNode(studentLogin.getPack().getSubId()));
				studentDetails.appendChild(subjectid);
				
				Element SubjectName = doc.createElement("SubjectName");
				SubjectName.appendChild(doc.createTextNode(studentLogin.getPack().getSubName()));
				studentDetails.appendChild(SubjectName);
			
				
				Element Date = doc.createElement("Date");
				Date.appendChild(doc.createTextNode(studentLogin.getPack().getDate().toString()));
				studentDetails.appendChild(Date);
				
			
				Element questionAnswers = doc.createElement("questionAnswers");
				student.appendChild(questionAnswers);
				
				Element StudentIdQ = doc.createElement("StudentId");
				StudentIdQ.appendChild(doc.createTextNode(studentLogin.getStudId()));
				questionAnswers.appendChild(StudentIdQ);
				
				
				
				 TrailDao trailDao=new TrailDao();
				List<Trail> trails=trailDao.getAllTrailByStudId(studentLogin.getId());
				
				 for(Trail trail:trails)
				{
					 
					 Element QuestionDetails = doc.createElement("QuestionDetails");
					questionAnswers.appendChild(QuestionDetails);
						
					String event="";
					String time="";
					String qIdCentral="";
					String qIdClient="";
					String opt="";
					
					if(trail.getMyEvent()!=null)
					{
						event=trail.getMyEvent();
					}
					
					if(trail.getMyDate()!=null)
					{
						time=trail.getMyDate().toString();
					}
					
					if(trail.getqIdCentral()!=null)
					{
						qIdCentral=trail.getqIdCentral();
					}
					
					if(trail.getqIdClient()!=null)
					{
						qIdClient=trail.getqIdClient();
					}
					
					if(trail.getOptionNo()!=null)
					{
						opt=trail.getOptionNo();
					}
					
				
					
					Element Event = doc.createElement("Event");
					Event.appendChild(doc.createTextNode(event));
					QuestionDetails.appendChild(Event);
					
					Element Time = doc.createElement("Time");
					Time.appendChild(doc.createTextNode(time));
					QuestionDetails.appendChild(Time);
					
					Element QuestionId = doc.createElement("QuestionId");
					QuestionId.appendChild(doc.createTextNode(qIdCentral));
					QuestionDetails.appendChild(QuestionId);
					
					Element QuestionIdClient = doc.createElement("QuestionIdClient");
					QuestionIdClient.appendChild(doc.createTextNode(qIdClient));
					QuestionDetails.appendChild(QuestionIdClient);
					
					
					Element Answser = doc.createElement("Answser");
					Answser.appendChild(doc.createTextNode(opt));
					QuestionDetails.appendChild(Answser);
				} 
			

				
				
	}			
				
	
	TransformerFactory transformerFactory = TransformerFactory.newInstance();
	Transformer transformer = transformerFactory.newTransformer();
	DOMSource source = new DOMSource(doc);
	StreamResult result = new StreamResult(new File("f:\\file.xml"));

	// Output to console for testing
	// StreamResult result = new StreamResult(System.out);

	transformer.transform(source, result);

	System.out.println("File saved!");
	
} catch (ParserConfigurationException pce) {
		pce.printStackTrace();
	  } catch (TransformerException tfe) {
		tfe.printStackTrace();
	  }

/* 
FileOutputStream fos = null;
BufferedOutputStream bos = null;
ServerSocket serverSocket=null;
Socket socket =null;

try {
	  serverSocket = new ServerSocket(5345);
	  System.out.print("Conneting");
	  socket = serverSocket.accept();
	  InputStream is = socket.getInputStream();
	  OutputStream os = socket.getOutputStream();
	
	  File file=new File("f:/Result105.xml");
	  Path path= Paths.get("f:/Result105.xml");
	  
		if(file.exists() && path!=null)
		{
		 // Sending
		
		byte[] toSendBytes = Files.readAllBytes(path);
		int toSendLen = toSendBytes.length;
		byte[] toSendLenBytes = new byte[4];
		toSendLenBytes[0] = (byte)(toSendLen & 0xff);
		toSendLenBytes[1] = (byte)((toSendLen >> 8) & 0xff);
		toSendLenBytes[2] = (byte)((toSendLen >> 16) & 0xff);
		toSendLenBytes[3] = (byte)((toSendLen >> 24) & 0xff);
		os.write(toSendLenBytes);
		os.write(toSendBytes);
		
		}
	
	System.out.println("file send: ");
	}
	catch(IOException o)
	{
		o.printStackTrace();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally {
	    if (fos != null) fos.close();
	    if (bos != null) bos.close();
	    if (socket != null) socket.close();
	    if (serverSocket != null)serverSocket.close(); 
	  } */

%>

</body>
</html>