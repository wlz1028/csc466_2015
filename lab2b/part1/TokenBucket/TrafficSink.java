import java.io.*;
import java.net.*;
import java.util.*;

public class TrafficSink {
  public static void main(String[] args) throws IOException {

	DatagramSocket socket = new DatagramSocket(4445);
	byte[] buf = new byte[1024];
	DatagramPacket p = new DatagramPacket(buf, buf.length);
	long previsuTime = 0;

//	PrintWriter fout = new PrintWriter("out.txt");
	FileOutputStream fout =  new FileOutputStream("out.txt");
	PrintStream pout = new PrintStream (fout);
	

	ArrayList<String> outTrace = new ArrayList<String>();

	int counter = 0;
	while (true){
		socket.receive(p);
		
		long time = System.nanoTime();
		// to put zero in first line
		if(previsuTime == 0)
		{
		    previsuTime = time;
		}
//		fout.println((time-previsuTime)/1000L +"\t" + p.getLength());
//		outTrace.add((time-previsuTime)/1000L +"\t" + p.getLength());
		pout.println( (time-previsuTime)/1000 +"\t" + p.getLength());
		previsuTime = time;
		counter += 1;
//		fout.println()
	}

//	System.out.println("finish");
//	for (String line : outTrace){
//		fout.println(line);
//	}

//    pout.close();
  }

}
