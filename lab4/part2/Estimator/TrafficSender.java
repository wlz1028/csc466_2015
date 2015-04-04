package Estimator;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;


public class TrafficSender implements Runnable{
	private int N;
	private int L;
	private long r;
	private String fileName;
	private String host;
	private int port;
	private long start_time;
	private long last_send_time;

	//in nanosec
	private int pktTimeIntv;
	private Sender sender;
	//setup out files
	private FileOutputStream fOut;
	private PrintStream pOut;

	public TrafficSender(int N, int L, long r,
			String host, int port, String fileName){
		this.N = N;
		this.L = L;
		this.r = r;
		this.pktTimeIntv = (int)((((double) L*8)/((double) r*1000))*1000000000);
		this.fileName = fileName;
		this.host = host;
		this.port = port;
	}

	public synchronized Long getStartTime(){
		return start_time;
	}

	public synchronized Long getLastTime(){
		return last_send_time;
	}

	public void run()
	{
		long ts = 0;
		last_send_time = 0;

		try{
			fOut = new FileOutputStream(fileName);
			pOut = new PrintStream (fOut);
			sender = new Sender(L, host, port);
			this.start_time = System.nanoTime();

			for(int i=1; i<=N; i++){
				if (i == 1){
					pOut.println(1+"\t"+last_send_time);
				} else {
					last_send_time = System.nanoTime() - start_time;
					pOut.println(i+"\t"+last_send_time);
				}
//				System.out.println(i);
				sender.send(L, i);

				ts = System.nanoTime();
				while ((System.nanoTime() - ts) < pktTimeIntv){;}

			}
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
