package Estimator;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class TrafficReceiver implements Runnable
{
	private TrafficSender ts;
	private String fileName;
	private int port;
	private int L;
	private FileOutputStream fOut;
	private PrintStream pOut;
	private int N;

	public TrafficReceiver(TrafficSender ts, int port, int L, int N, String fileName)
	{
		this.ts = ts;
		this.fileName = fileName;
		this.port = port;
		this.L = L;
		this.N = N;
	}

	public void run()
	{		
		DatagramSocket socket = null;
		try
		{
			socket = new DatagramSocket(port);
			byte[] buf = new byte[L];
			int noTokens;
			long bufferSize;

			fOut = new FileOutputStream(fileName);
			pOut = new PrintStream (fOut);

			int seqNo = 0;
			DatagramPacket packet =
				new DatagramPacket(buf, buf.length);
			// receive and put packets in buffer (or send immediately)
			int n = 0;
			long rec_time = 0l;
			long start_time = 0l;
			while (n < N)
			{	
				socket.receive(packet);
				if (start_time == 0) {
					start_time = ts.getStartTime();
				}

				seqNo = fromByteArray(packet.getData(),2,2);
				rec_time = (System.nanoTime()-start_time)/1000;
				pOut.println(seqNo+"\t"+ts.getLastTime(n)/1000+"\t"+rec_time);
				n++;
			}
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	public static int fromByteArray(byte [] value, int start, int length) {
		int Return = 0;
		for (int i=start; i< start+length; i++)
		{
			Return = (Return << 8) + (value[i] & 0xff);
		}
		return Return;
	}
}
