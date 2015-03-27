import java.io.*;
import java.net.*;

public class Sender {

  public int port = 4444;
  public InetAddress addr = null;
  public DatagramPacket packet = null;
  public DatagramSocket socket = null;
  public byte[] buf = null;


  public Sender(String ip) throws IOException{
    this.addr = InetAddress.getByName(ip);
    byte[] buf = new byte[2000];
    this.packet = new DatagramPacket(buf, 0, addr, port);
    this.socket = new DatagramSocket();
  }

	public void send(int fSize, byte tag) throws IOException {
	int sendSize = 0;
	while(fSize > 0 ){
		if (fSize < 1480 ){
			sendSize = fSize;
			fSize = 0;
		} else {
			sendSize = 1480-1;
			fSize = fSize - sendSize;
		}
		buf  = new byte[sendSize+1];
		buf[0] = tag;
		packet.setData(buf);
		socket.send(packet);
		}
	}
}
