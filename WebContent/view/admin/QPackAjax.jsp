<%@page import="manipal.onlineexam.student.dao.StudentLoginDao"%>
<%@page import="manipal.onlineexam.student.entity.StudentLogin"%>
<%@page import="manipal.onlineexam.student.dao.QPackDao"%>
<%@page import="java.util.Date"%>
<%@page import="manipal.onlineexam.student.entity.QPack"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.Socket"%>

<%@page import="java.net.ServerSocket"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page language="java" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%
	System.out.print("In Ajax");
		String drive="f:/";
		String fileName="my";
		String ext=".xml";
		String fileNameChk=drive+fileName+ext;
		String  FILE_TO_RECEIVED = fileNameChk;
		File fileCheck=new File(fileNameChk);
		if(fileCheck.exists())
		{
			for(int i=0;;i++)
			{
				fileName=fileName+i;
				File fileTemp=new File(drive+fileName+ext);
				if(!fileTemp.exists())
				{
					FILE_TO_RECEIVED=drive+fileName+ext;
					break;
				}
			}
		}
	
		

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
		
		
		
		// Receiving
		byte[] lenBytes = new byte[4];
		is.read(lenBytes, 0, 4);
		int len = (((lenBytes[3] & 0xff) << 24) | ((lenBytes[2] & 0xff) << 16) |
		        ((lenBytes[1] & 0xff) << 8) | (lenBytes[0] & 0xff));
		
		byte[] receivedBytes = new byte[len];
		
		
		int bytesRead =is.read(receivedBytes, 0, len);// read byte from stream
		int current = 0;
		current = bytesRead;
		
		fos = new FileOutputStream(FILE_TO_RECEIVED);
		bos = new BufferedOutputStream(fos);
		
		    bos.write(receivedBytes, 0 , current);
		    bos.flush();
		    System.out.println("File " + FILE_TO_RECEIVED
		        + " downloaded (" + current + " bytes read)");
		
		   /*  if(current!=0)
		    {
		    	out.println("Successfully downloaded");	
		    }
		    else
		    {
		    	out.println("Not downloaded");
		    } */
		    
		    
		String received = new String(receivedBytes, 0, len);
		
		System.out.println("Server received: " + received);
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
		  }

		
		
		
		
		/*  // Sending
		String toSend = "Echo: " + received;
		byte[] toSendBytes = toSend.getBytes();
		int toSendLen = toSendBytes.length;
		byte[] toSendLenBytes = new byte[4];
		toSendLenBytes[0] = (byte)(toSendLen & 0xff);
		toSendLenBytes[1] = (byte)((toSendLen >> 8) & 0xff);
		toSendLenBytes[2] = (byte)((toSendLen >> 16) & 0xff);
		toSendLenBytes[3] = (byte)((toSendLen >> 24) & 0xff);
		os.write(toSendLenBytes);
		os.write(toSendBytes);*/
		
		
			//================================================================

		try
		{
			
			
		//==========================================
				
				
				
		//===========================================
		File fXmlFile = new File(FILE_TO_RECEIVED);
		if(fXmlFile!=null && fXmlFile.exists())
		{
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory
		.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(fXmlFile);
		
		doc.getDocumentElement().normalize();
		
		System.out.println("Root element :"
		+ doc.getDocumentElement().getNodeName());

		NodeList nList = doc.getElementsByTagName("ExamDetails");
		
		for (int temp = 0; temp < nList.getLength(); temp++) {

			Node nNode = nList.item(temp);

			System.out.println("\nCurrent Element :" + nNode.getNodeName());

			if (nNode.getNodeType() == Node.ELEMENT_NODE) {

		Element eElement = (Element) nNode;

		
		
		System.out.println("examId : "+ eElement.getElementsByTagName("ExamId").item(0).getTextContent());
		System.out.println("examName : "+ eElement.getElementsByTagName("ExamName").item(0).getTextContent());
		System.out.println("subId 1 : "+ eElement.getElementsByTagName("subjectid").item(0).getTextContent());
		System.out.println("subName 2 : "+ eElement.getElementsByTagName("SubjectName").item(0).getTextContent());
		System.out.println("paperId 3 : "+ eElement.getElementsByTagName("PaperId").item(0).getTextContent());
		System.out.println("duration 4 : "+ eElement.getElementsByTagName("Duration").item(0).getTextContent());
		
		
		QPack qPack=new QPack();
		QPackDao qPackDao=new QPackDao();
		StudentLoginDao studentLoginDao=new StudentLoginDao();
		
		studentLoginDao.delAllStudent();
		qPackDao.delAllQpack();
		
		qPack.setqPackName(eElement.getElementsByTagName("ExamName").item(0).getTextContent());
		qPack.setDate(new Date());
		qPack.setPath(FILE_TO_RECEIVED);
		qPack.setDuration(eElement.getElementsByTagName("Duration").item(0).getTextContent());
		qPack.setActivationStatus("0");
		qPack.setExamId(eElement.getElementsByTagName("ExamId").item(0).getTextContent());
		qPack.setSubId(eElement.getElementsByTagName("subjectid").item(0).getTextContent());
		qPack.setSubName(eElement.getElementsByTagName("SubjectName").item(0).getTextContent());
		qPack.setPaperId(eElement.getElementsByTagName("PaperId").item(0).getTextContent());

		if(qPackDao.addQpack(qPack))
		{
			out.print("Downloaded Successfully.");
			NodeList nListStud = doc.getElementsByTagName("Student");
			
			for (int i = 0; i < nListStud.getLength(); i++) {

				Node nNodeStud = nListStud.item(i);

				System.out.println("\nCurrent Element :" + nNodeStud.getNodeName());

				if (nNodeStud.getNodeType() == Node.ELEMENT_NODE) {

			Element eElementStud = (Element) nNodeStud;

			System.out.println("question id : "+ eElementStud.getAttribute("StudentId"));
			
			System.out.println("studentName : "+ eElementStud.getElementsByTagName("Name").item(0).getTextContent());
			System.out.println("studUserName : "+ eElementStud.getElementsByTagName("UserName").item(0).getTextContent());
			System.out.println("studPass 1 : "+ eElementStud.getElementsByTagName("Password").item(0).getTextContent());
			System.out.println("college 2 : "+ eElementStud.getElementsByTagName("College").item(0).getTextContent());
			
			
			StudentLogin studentLogin=new StudentLogin();
		
			
			
			studentLogin.setStudId(eElementStud.getAttribute("StudentId"));
			studentLogin.setUserName(eElementStud.getElementsByTagName("UserName").item(0).getTextContent());
			studentLogin.setPass(eElementStud.getElementsByTagName("Password").item(0).getTextContent());
			studentLogin.setStudName(eElementStud.getElementsByTagName("Name").item(0).getTextContent());
			studentLogin.setCollege(eElementStud.getElementsByTagName("College").item(0).getTextContent());
			studentLogin.setPhotoPath(eElementStud.getElementsByTagName("Image").item(0).getTextContent());
			
			if(i%2==0)
			{
				studentLogin.setDivMain("Left");
				studentLogin.setDivMenu("Right");
			}
			else
			{
				studentLogin.setDivMain("Right");
				studentLogin.setDivMenu("Left");
			}
			
			studentLogin.setLoginStatus("0");
			studentLogin.setPack(qPack);		
			studentLoginDao.addStudentLogin(studentLogin);
			
				}}
			
		}
		
		

			}
		}
		}
		else
		{
			out.print("Not Downloaded.");
		}//end of file exists
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
			out.print("Not Downloaded.");
		}
		
	%>
</body>
</html>