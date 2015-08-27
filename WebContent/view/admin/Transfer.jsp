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
	  }

%>

</body>
</html>