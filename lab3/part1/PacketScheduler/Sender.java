import java.io.*;
import java.net.*;

public class Sender {

  public int port = 4444;
  public InetAddress addr = null;
  public DatagramPacket packet = null;
  public DatagramSocket socket = null;


  public Sender(String ip) throws IOException{
    this.addr = InetAddress.getByName(ip);
    byte[] buf = new byte[2000];
    this.packet = new DatagramPacket(buf, 0, addr, port);
    this.socket = new DatagramSocket();
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
	  packet.setLength(sendSize);
	  socket.send(packet);
//          socket.close();
    }
  }
}
