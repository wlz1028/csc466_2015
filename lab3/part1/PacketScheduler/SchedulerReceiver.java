package PacketScheduler;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;


/**
 * Listens on specified port for incoming packets.
 * Packets are stored to queues.
 */
public class SchedulerReceiver implements Runnable
{
	// queues used to store incoming packets 
	private Buffer[] buffers;
	// port on which packets are received
	private int port;
	// name of output file
	private String fileName;
	
	/**
	 * Constructor.
	 * @param buffers Buffers to which packets are stored. 
	 * @param port Port on which to lister for packets.
	 * @param fileName Name of output file.
	 */
	public SchedulerReceiver(Buffer[] buffers, int port, String fileName)
	{
		this.buffers = buffers;
		this.port = port;
		this.fileName = fileName;
	}

	/**
	 * Listen on port and send out or store incoming packets to buffers.
	 * This method is invoked when starting a thread for this class.
	 */  
	public void run()
	{		
		DatagramSocket socket = null;
		PrintStream pOut = null;	
		PrintStream pOut_discard = null;	
		PrintStream pOut_rec = null;	
		
		try
		{
			FileOutputStream fOut =  new FileOutputStream(fileName);
			FileOutputStream fOut_discard =  new FileOutputStream("discard_"+fileName);
			FileOutputStream fOut_rec =  new FileOutputStream("rec_"+fileName);
			pOut = new PrintStream (fOut);
			pOut_discard = new PrintStream (fOut_discard);
			pOut_rec = new PrintStream (fOut_rec);

			long previsuTime = 0;
			
			socket = new DatagramSocket(port);
			
			// receive and process packets
			while (true)
			{
				byte[] buf = new byte[Buffer.MAX_PACKET_SIZE];
				DatagramPacket packet = new DatagramPacket(buf, buf.length);
				
				// wait for packet, when arrives receive and recored arrival time
				socket.receive(packet);
				long startTime=System.nanoTime();
				
				/*
				 * Record arrival to file in following format:
				 * elapsed time (microseconds), packet size (bytes), backlog in buffers ordered by index in array (bytes).
				 */
				// to put zero for elapsed time in first line
				if(previsuTime == 0)
				{
					previsuTime = startTime;
				}
				pOut.print((startTime-previsuTime)/1000 + "\t" + packet.getLength() + "\t");
				for (int i = 0; i<buffers.length; i++)
				{
					long bufferSize = buffers[i].getSizeInBytes();
					pOut.print(bufferSize + "\t");
				}
				pOut.println();

				pOut_rec.println(System.nanoTime());
				
				/*
				 * Process packet.
				 */
				
				// add packet to a queue if there is enough space
				if (buffers[0].addPacket(new DatagramPacket(packet.getData(), packet.getLength())) < 0)
				{
//					System.err.println("Packet dropped (queue full).");
					pOut_discard.println((startTime-previsuTime)/1000 + "\t" + packet.getLength() + "\t" + 1);
				} else {
					pOut_discard.println((startTime-previsuTime)/1000 + "\t" + packet.getLength() + "\t" + 0);
				}
				previsuTime = startTime;
				/*
				 * TODO: 
				 * Replace previous command with code that:
				 * - implements packet classifier 
				 * - stores packets to appropriate queue
				 * - reports and/or logs packets drops with all information you need
				 */
			}
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
