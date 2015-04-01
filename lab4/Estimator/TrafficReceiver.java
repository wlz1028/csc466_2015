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

	public TrafficReceiver(TrafficSender ts, int port, int L, String fileName)
	{
		this.ts = ts;
		this.fileName = fileName;
		this.port = port;
		this.L = L;
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

			long start_time = 0;
			long previsuTime = 0;
			long rec_ts = 0;
			Long[] times;
			int seqNo = 0;
			
			// receive and put packets in buffer (or send immediately)
			while (true)
			{	
				DatagramPacket packet =
					new DatagramPacket(buf, buf.length);
				socket.receive(packet);
//				start_time = System.nanoTime();
				
//				if ( previsuTime == 0 ){
//					previsuTime = start_time;
//				}
				//record seqNo and timestamp to hashtable
//				rec_ts = (int) (start_time - previsuTime)/1000;
				seqNo = fromByteArray(packet.getData(),2,2);
				System.out.println("Got seq = "+seqNo);
				times = ts.getSendTime(seqNo-1);
				System.out.println("Get "+times[0]+"\t"+times[1]);
				System.out.println("Now " + System.nanoTime());
//
				pOut.println(seqNo+"\t"+times[0]+"\t"+(System.nanoTime()-times[1])/1000);
//				System.out.println("* get "+packet.getLength());
				previsuTime = start_time;
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
