import java.io.*;
import java.net.*;
import java.util.*;



public class TrafficSink {
  public static void main(String[] args) throws IOException {

    DatagramSocket socket = new DatagramSocket(4444);
    byte[] buf = new byte[256];
    DatagramPacket p = new DatagramPacket(buf, buf.length);
    socket.receive(p);

    System.out.println(0+"\t" + p.getLength());

    long start_time = System.nanoTime();
    while (true){
        socket.receive(p);
        long total_time = System.nanoTime() - start_time;
        total_time = total_time / 1000L;
        System.out.println(total_time +"\t" + p.getLength());
    }
  }
}
