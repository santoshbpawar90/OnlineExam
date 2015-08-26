<%@page import="java.net.UnknownHostException"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.InterfaceAddress"%>
<%@page import="java.util.List"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.File"%>
<%@page import="java.rmi.registry.LocateRegistry"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.NetworkInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap-theme.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.min.js"></script>
<%@include file="QPackMain.jsp" %>
</head>
<body>

<%
 
/* Enumeration<NetworkInterface> netEnumeration= NetworkInterface.getNetworkInterfaces();

if(netEnumeration!=null)
{
	if(netEnumeration.hasMoreElements())
	{
		out.print("SP----->");
		out.print("<BR>"+netEnumeration.nextElement().getDisplayName());
		out.print("<BR>"+netEnumeration.nextElement().getHardwareAddress());
		out.print("<BR>"+netEnumeration.nextElement().getInterfaceAddresses());
		out.print("<BR>"+netEnumeration.nextElement().getDisplayName());
		out.print("<BR>"+netEnumeration.nextElement().getDisplayName());
	}
}
  */

/* //===============================================================  
  //for memory status.
out.print("<BR><BR>"+Runtime.getRuntime().availableProcessors());
out.print("<BR>"+Runtime.getRuntime().freeMemory());
out.print("<BR>"+Runtime.getRuntime().totalMemory());
out.print("<BR>"+Runtime.getRuntime().maxMemory());
out.print("<BR>==============================================<BR>");

//===============================================================
//for OS information
String nameOS = "os.name";  
String versionOS = "os.version";  
String architectureOS = "os.arch";
out.println("<BR><BR> The information about OS");
out.println("<BR>Name of the OS: " + System.getProperty(nameOS));
out.println("<BR>Version of the OS: " + System.getProperty(versionOS));
out.println("<BR>Architecture of THe OS: " +System.getProperty(architectureOS));
out.print("<BR>==============================================<BR>");
//===============================================================



out.println("<BR><BR> The information about Hardware");
out.println("Available processors (cores): " + Runtime.getRuntime().availableProcessors());
out.println("<BR>Name of the OS: " + System.getenv("PROCESSOR_IDENTIFIER"));
out.println("<BR>Version of the OS: " + System.getenv("PROCESSOR_ARCHITECTURE"));
out.println("<BR>Architecture of THe OS: " +System.getenv("PROCESSOR_ARCHITEW6432"));
out.println("<BR>Architecture of THe OS: " +System.getenv("NUMBER_OF_PROCESSORS"));

out.print("<BR>==============================================<BR>");
//===============================================================


File[] roots = File.listRoots();


for (File root : roots) {
  out.println("<BR><BR>File system root: " + root.getAbsolutePath());
  out.println("<BR>Total space (bytes): " + root.getTotalSpace()+" byte");
  out.println("<BR>Free space (bytes): " + root.getFreeSpace()+" byte");
  out.println("<BR>Usable space (bytes): " + root.getUsableSpace()+" byte");
}
out.print("<BR>==============================================<BR>");

//===============================================================

 */
/* try {
    Enumeration e = NetworkInterface.getNetworkInterfaces();

    while(e.hasMoreElements()) {
       NetworkInterface ni = (NetworkInterface) e.nextElement();
       System.out.println("<BR><BR><BR>Net interface: "+ni.getName());

       Enumeration e2 = ni.getInetAddresses();
       
       
       List<InterfaceAddress> addresses=ni.getInterfaceAddresses();


       if(addresses!=null)
       {
        	for(InterfaceAddress address:addresses)
        	{
        		out.print("<BR><BR>MY Name="+address.getAddress());
        	}
       }


       while (e2.hasMoreElements()){
          InetAddress ip = (InetAddress) e2.nextElement();
          out.println("<BR>IP address: "+ ip.toString());
       }
    }
 }
 catch (Exception e) {
    e.printStackTrace();
 }


 */

//===============================================================
/*  
InetAddress address=InetAddress.getByName("URMS.COM");
byte[] bs=address.getAddress();

if(bs!=null)
for(byte b:bs)
{
	out.print("<BR>"+b);
}



out.print("+++++++++++++++++++++++++++++++++++++++++"); */

//===============================================================
List<String> cmpList=new  ArrayList<String>();
try 
{ 
	
	//for linux -1)arp-scan --localnet 2)sudo arp-scan -l --interface=eth0
Process p=Runtime.getRuntime().exec("NET VIEW"); 
p.waitFor(); 
BufferedReader reader=new BufferedReader(new InputStreamReader(p.getInputStream())); 
String line=reader.readLine();
char[] myChar=null;
String totalString="";

while(line!=null) 
{ 
	//out.print("<BR>"+line);
	totalString=totalString+line;
	line=reader.readLine();
	
	
} 

 	//out.print("<BR>"+totalString);

 
if(totalString!=null)
{

	Matcher matcher =Pattern.compile("(\\\\)(.*?)(\\s)").matcher(totalString) ;
	while (matcher.find()) 
	{
	    String url = matcher.group();
	    url=url.replaceAll("\\\\", "");
	    cmpList.add(url);
	   // out.print("<BR>"+url);
	}
	
	
	if(cmpList!=null)
	{
		//out.print("<BR>No of Computer in network-->"+cmpList.size());
	}
}


} 
catch(IOException e1) {} 
catch(InterruptedException e2) {} 

int count=0;

%>

<div class="row">	
	  <div class="col-md-1" align="right">
	  </div>
	  <div class="col-md-10" align="right">
	  
	  	
	  	<table class="table table-bordered table-hover">
			<tr class="info">
				<td align="center"><b>Sr. No</b></td>
				<td align="center"><b>Computer Name</b></td>
				<td align="center"><b>IP Address</b></td>								
				<td align="center"><b>Status</b></td>
				
				
				
			</tr>
			
			
			<%
			
			if(cmpList!=null)
			{
				for(String cmpName: cmpList)
				{
					
					try {
					    InetAddress address = InetAddress.getByName(cmpName);
					  
				%>
				<tr>
				<td align="center"><%=++count %></td>
				
				<td align="center"><%=cmpName %></td>
				<td align="center"><%=address.getHostAddress() %></td>
				<td align="center"><%
						
				 if(address.isReachable(2000)){
				    	out.println("<b style='color: green;'>Active</b>" );
				    }else{
				    	out.println("<b style='color: red;'>Inactive</b>" );
				    	
				    } 
				    
				 %></td>
				
				</tr>
				<%	
					 }
					  catch (UnknownHostException e) {
					    System.err.println("Unable to lookup-UnknownHostException");
					  }
					  catch (IOException e) {
					    System.err.println("Unable to reach-IOException");
					  }
				}
			}
			%>
			</table>
			
		</div>
		
		
		
		
		</div>

</body>
</html>