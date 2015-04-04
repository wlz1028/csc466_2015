package Estimator;

public class Estimator implements Runnable
{
	private TrafficSender ts;
	private TrafficReceiver tr;
	
	public static void main(String[] args) 
	{
		int N = Integer.parseInt(args[0]);
		int L = Integer.parseInt(args[1]);
		long r = Long.parseLong(args[2]);

		Estimator est = new Estimator(N, L, r);
		new Thread(est).start();
	}
	
	public Estimator(int N, int L, long r)
	{
		String fName;
		fName = "ts_out_N_"+N+"_L_"+L+"_r_"+r+".txt";
		ts = new TrafficSender(N,L,r,"localhost",4444,fName);
		fName = "tr_out_N_"+N+"_L_"+L+"_r_"+r+".txt";
		tr = new TrafficReceiver(ts,4445,L,N,fName);
	}
	
	/**
	 * Start token generator, receiver, and sender threads for token bucket.
	 * This method is invoked when starting a thread for this class. 
	 */
	public void run()
	{
		new Thread(ts).start();
		new Thread(tr).start();
	}
}
