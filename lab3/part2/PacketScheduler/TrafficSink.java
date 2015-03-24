import java.io.*;
import java.net.*;
import java.util.*;

public class TrafficSink {
  public static void main(String[] args) throws IOException {

	DatagramSocket socket = new DatagramSocket(4445);
	byte[] buf = new byte[1480];
	byte tag;
	DatagramPacket p = new DatagramPacket(buf, buf.length);
	long previsuTime = 0;

//	PrintWriter fout = new PrintWriter("out.txt");
	FileOutputStream fout =  new FileOutputStream("out.txt");
	PrintStream pout = new PrintStream (fout);
	

	ArrayList<String> outTrace = new ArrayList<String>();

	int counter = 0;
	while (true){
		socket.receive(p);
//		tag = p.getData()[0];
//		System.out.println(tag);
		long time = System.nanoTime();
		// to put zero in first line
		if(previsuTime == 0)
		{
		    previsuTime = time;
		}
		pout.println( (time-previsuTime)/1000 +"\t" + p.getLength());
		previsuTime = time;
		counter += 1;
	}
  }

}
