import java.io.*;
import java.net.*;

public class Sender {

  public int port = 4444;
  public InetAddress addr = null;


  public Sender(String ip) throws IOException{
    this.addr = InetAddress.getByName(ip);
  }

  public void send(int fSize) throws IOException {
    byte[]      buf  = new byte[fSize];
    DatagramPacket packet =
                 new DatagramPacket(buf, buf.length, addr, port);
    DatagramSocket socket = new DatagramSocket();
    socket.send(packet);
    socket.close();
  }
}

