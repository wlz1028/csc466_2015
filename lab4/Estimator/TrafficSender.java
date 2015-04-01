package Estimator;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;


public class TrafficSender implements Runnable{
	private Map<Integer, Long[]> pktRec;
	private int N;
	private int L;
	private long r;
	private String fileName;
	private String host;
	private int port;

	//in nanosec
	private int pktTimeIntv; private Sender sender;
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
		pktRec = new HashMap<Integer, Long[]>();
	}

	public synchronized Long[] getSendTime(Integer seqNo){
//		System.out.println("** Getting Seq =  " + seqNo +" got: "+pktRec.get(seqNo));
		return pktRec.get(seqNo);
	}

	public void run()
	{
		long start_time = 0;
		long previsuTime = 0;
		long toWait = 0;
		Integer ts = 0;

		try{
			fOut = new FileOutputStream(fileName);
			pOut = new PrintStream (fOut);
			sender = new Sender(L, host, port);
			Long[] times = new Long[2];
			times[0] = 0L;
			times[1] = System.nanoTime();
			pktRec.put(0, times);
			System.out.println("Put 0 "+times[0]+"\t"+times[1]);

			for(int i=1; i<=N; i++){
				start_time = System.nanoTime();
				sender.send(L, i);
				times = new Long[2];
				times[1] = System.nanoTime();
//				System.out.println("Put "+"\t"+i+"\t"+times[0]+"\t"+times[1]);
//				toWait = (long) pktTimeIntv - (System.nanoTime()-start_time);
//				while ((System.nanoTime() - start_time) < toWait){;}
				while ((System.nanoTime() - start_time) < pktTimeIntv){;}

				//record seqNo and timestamp to hashtable
				ts = (int) (start_time - previsuTime)/1000;
				if ( previsuTime == 0 ){
					ts = (int) (System.nanoTime() - start_time)/1000;
				}
//				System.out.println("ts= "+ts);
				times[0] = (long) ts;
				pktRec.put(i, times);
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
