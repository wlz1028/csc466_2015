package Estimator;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;


public class TrafficSender implements Runnable{
	private Map<Integer, Integer> pktRec;
	private int N;
	private int L;
	private long r;
	private String fileName;
	private String host;
	private int port;

	//in nanosec
	private int pktTimeIntv;
	private Sender sender;
	//setup out files
	private FileOutputStream fOut;
	private PrintStream pOut;

	public TrafficSender(int N, int L, long r,
			String host, int port, String fileName){
//		System.out.println(N+"\t"+L+"\t"+r);
		this.N = N;
		this.L = L;
		this.r = r;
		this.pktTimeIntv = (int)((((double) L*8)/((double) r*1000))*1000000000);
//		System.out.println("pkt interval: "+pktTimeIntv);
		this.fileName = fileName;
		this.host = host;
		this.port = port;
		pktRec = new HashMap<Integer, Integer>();
	}

	public synchronized int getSendTime(int seqNo){
		return pktRec.get(seqNo);
	}

	public void run()
	{
		long start_time = 0;
		long previsuTime = 0;
		long toWait = 0;
		int ts = 0;

		try{
			fOut = new FileOutputStream(fileName);
			pOut = new PrintStream (fOut);
			sender = new Sender(L, host, port);

			for(int i=0; i<N; i++){
				start_time = System.nanoTime();
				sender.send(L, i);
				toWait = (long) pktTimeIntv - (System.nanoTime()-start_time);
				while ((System.nanoTime() - start_time) < toWait){;}

				if ( previsuTime == 0 ){
					previsuTime = start_time;
				}
				//record seqNo and timestamp to hashtable
				ts = (int) (start_time - previsuTime)/1000;
				pktRec.put(i, ts);
				pOut.println(i+"\t"+ts);
				previsuTime = start_time;
			}
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
