package temp;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class ServerByteStreamWithoutOIS {

	public static void main(String[] args) throws IOException, ClassNotFoundException{
		int port = 49154;
		Socket sock = null; 
		InetAddress addr = null;
		addr = InetAddress.getByName("172.24.11.33");    
		sock = new Socket(addr, port);
		System.out.println("created socket!");
		int count = 0;
		while(true){
			System.out.println("in while");
		String line = "";
		String realLine = "";
		BufferedReader bReader = new BufferedReader(new InputStreamReader(sock.getInputStream()));
		byte[] buffer = null;
		while((line=bReader.readLine() )!=null){
			System.out.println("while readline");
		realLine = realLine + line;
		System.out.println(line.getBytes());
		}

		buffer = realLine.getBytes();

		//buffer = (byte[])ois.readObject();

		ByteArrayInputStream bis = new ByteArrayInputStream(buffer);
		Iterator<?> readers = ImageIO.getImageReadersByFormatName("jpg");

		ImageReader reader = (ImageReader) readers.next();
		Object source = bis; // File or InputStream, it seems file is OK
		System.out.println("readimage");
		ImageInputStream iis = ImageIO.createImageInputStream(source);
		//Returns an ImageInputStream that will take its input from the given Object

		reader.setInput(iis, true);
		ImageReadParam param = reader.getDefaultReadParam();

		Image image = reader.read(0, param);
		//got an image file

		BufferedImage bufferedImage = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_RGB);
		//bufferedImage is the RenderedImage to be written
		Graphics2D g2 = bufferedImage.createGraphics();
		g2.drawImage(image, null, null);
		File imageFile = new File("image.bmp");
		ImageIO.write(bufferedImage, "bmp", imageFile); 

		System.out.println(imageFile.getPath());

		//Thread.sleep(100);
		System.out.println("Done saving");
		}
		}
	}


