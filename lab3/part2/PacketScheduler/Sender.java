import java.io.*;
import java.net.*;

public class Sender {

  public int port = 4444;
  public InetAddress addr = null;


  public Sender(String ip) throws IOException{
    this.addr = InetAddress.getByName(ip);
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
		
		byte[]      buf  = new byte[sendSize+1];
		buf[0] = tag;
		DatagramPacket packet =
			new DatagramPacket(buf, buf.length, addr, port);
		DatagramSocket socket = new DatagramSocket();
		socket.send(packet);
		socket.close();
		}
	}
}
