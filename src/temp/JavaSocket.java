package temp;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;



public class JavaSocket {

	
	public static void main(String[] args) throws IOException {
		  String  FILE_TO_RECEIVED = "F:/my.xml";
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
        
        String received = new String(receivedBytes, 0, len);

        System.out.println("Server received: " + received);
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
    }
	
}
