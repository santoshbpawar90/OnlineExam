package temp;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.Socket;

public class SockClient {
	
	public static void main(String[] argv) throws Exception {
	    Socket sock = new Socket("172.24.11.33", 49154);
	    byte[] mybytearray = new byte[1024];
	    InputStream is = sock.getInputStream();
	    FileOutputStream fos = new FileOutputStream("f:/s.txt");
	    BufferedOutputStream bos = new BufferedOutputStream(fos);
	    int bytesRead = is.read(mybytearray, 0, mybytearray.length);
	    bos.write(mybytearray, 0, bytesRead);
	    bos.close();
	    sock.close();
	    System.out.println("Success");
	  }

}
