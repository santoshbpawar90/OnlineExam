<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.Socket"%>
<%@page import="java.net.ServerSocket"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


String  FILE_TO_RECEIVED = "F:/studInfo.xml";
  FileOutputStream fos = null;
  BufferedOutputStream bos = null;
  ServerSocket serverSocket = new ServerSocket(5344);
  Socket socket = serverSocket.accept();
  InputStream is = socket.getInputStream();
  OutputStream os = socket.getOutputStream();
try {


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
/*byte [] mybytearray  = new byte [bytesRead];
do {
       bytesRead =
          is.read(mybytearray, current, (mybytearray.length-current));
       if(bytesRead >= 0) current += bytesRead;
    } while(bytesRead > -1);
*/
    bos.write(receivedBytes, 0 , current);
    bos.flush();
    System.out.println("File " + FILE_TO_RECEIVED
        + " downloaded (" + current + " bytes read)");

    if(current!=0)
    {
    	out.println("File " + FILE_TO_RECEIVED
                + " downloaded (" + current + " bytes read)");	
    }
    else
    {
    	out.println("File Not downloaded (" + current + " bytes read)");
    }
    
    
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

socket.close();
serverSocket.close();



%>
</body>
</html>