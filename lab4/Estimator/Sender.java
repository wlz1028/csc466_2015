package Estimator;

import java.io.*;
import java.net.*;

public class Sender {

	public InetAddress addr = null;
	public DatagramPacket packet = null;
	public DatagramSocket socket = null;
	public byte[] buf = null;


	public Sender(int L, String ip, int port) throws IOException{
		this.addr = InetAddress.getByName(ip);
		this.buf = new byte[L];
		System.arraycopy(toByteArray(port),2,buf,0,2);
		this.packet = new DatagramPacket(buf, 0, addr, port);
		this.socket = new DatagramSocket();
  }

	public void send(int fSize, int seqNo) throws IOException {
	int sendSize = 0;
	while(fSize > 0 ){
		if (fSize < 1480 ){
			sendSize = fSize;
			fSize = 0;
		} else {
			sendSize = 1480-1;
			fSize = fSize - sendSize;
		}
		System.arraycopy(toByteArray(seqNo),2,buf,2,2);
		packet.setData(buf);
		socket.send(packet);
		}
	}

	public static byte[] toByteArray(int value){
		byte [] Result = new byte[4];
		Result[3] = (byte) ((value >>> (8*0)) & 0xFF);
		Result[2] = (byte) ((value >>> (8*2)) & 0xFF);
		Result[1] = (byte) ((value >>> (8*1)) & 0xFF);
		Result[0] = (byte) ((value >>> (8*3)) & 0xFF);
		return Result;
	}
}
