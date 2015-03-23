import java.io.*;
import java.net.*;

public class Sender {

  public int port = 4444;
  public InetAddress addr = null;


  public Sender(String ip) throws IOException{
    this.addr = InetAddress.getByName(ip);
  }

  public void send(int fSize) throws IOException {
      int sendSize = 0;
      while(fSize > 0 ){
          if (fSize < 1024*10 ){
              sendSize = fSize;
              fSize = 0;
          } else {
              sendSize = 1024;
              fSize = fSize - sendSize;
          }
          byte[]      buf  = new byte[sendSize];
          DatagramPacket packet =
                       new DatagramPacket(buf, buf.length, addr, port);
          DatagramSocket socket = new DatagramSocket();
          socket.send(packet);
          socket.close();
    }
  }
}
