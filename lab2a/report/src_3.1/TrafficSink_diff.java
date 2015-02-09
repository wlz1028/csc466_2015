import java.io.*;
import java.net.*;
import java.util.*;

public class TrafficSink_diff{
  public static void main(String[] args) throws IOException {

    DatagramSocket socket = new DatagramSocket(4444);
    byte[] buf = new byte[1000];
    DatagramPacket p = new DatagramPacket(buf, buf.length);

    long previsuTime = 0;
    while (true){
        socket.receive(p);

        long time = System.nanoTime();
        // to put zero in first line
        if(previsuTime == 0)
        {
            previsuTime = time;
        }
        System.out.println((time-previsuTime)/1000L +"\t" + p.getLength());
        previsuTime = time;
    }
  }
}
