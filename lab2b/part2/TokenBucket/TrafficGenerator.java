import java.io.*; 
import java.util.*; 

class TrafficGenerator {
	public static void main (String[] args) { 
		
		
		BufferedReader bis = null; 
		String currentLine = null; 
		PrintStream pout = null;

		int I_frame_size = 0;
		int I_frame_no = 0;
		int P_frame_size = 0;
		int P_frame_no = 0;
		int B_frame_size = 0;
		int B_frame_no = 0;

		try {
			
			Sender mySender = new Sender("127.0.0.1");
			ArrayList<String> input_content;
			int T = 160*2;
			int N = 1;
			int L = 100;
			int n = 10000;
			input_content = generate_taffic(T, N, L, n);
                        for (String _currentLine: input_content) {
				
				/*
				 *  Parse line and break up into elements 
				 */
				StringTokenizer st = new StringTokenizer(_currentLine); 
				String col1 = st.nextToken(); 
				String col2 = st.nextToken(); 
				String col3  = st.nextToken(); 

				int Ftime = Integer.parseInt(col1);
				int packetNo = Integer.parseInt(col2);
				int Fsize = Integer.parseInt(col3);
				
				/*
				 *  Wait Ftime msec
				 */
                                long time_delta = Ftime;
                                long start_time = System.nanoTime();
                                while ((System.nanoTime() - start_time)/1000 < time_delta){;}
//				long waited = System.nanoTime() - start_time;

				for(int i = 0; i< packetNo; i++){
                                	mySender.send(Fsize);
				}
			}
		} catch (IOException e) {  
			// catch io errors from FileInputStream or readLine()  
			System.out.println("IOException: " + e.getMessage());  
                        e.printStackTrace();
		} finally {  
			// Close files   
			if (bis != null) { 
				try { 
					bis.close(); 
					pout.close();
				} catch (IOException e) { 
					System.out.println("IOException: " +  e.getMessage());  
				} 
			} 
		} 
	}  

	static ArrayList<String> generate_taffic(Integer T, Integer  N,
			Integer  L,Integer   n){
		ArrayList<String> traffic = new ArrayList<String>();
		int i = 0;
		while (i < n){
			traffic.add(T+"\t"+N+"\t"+L);
//			System.out.println(T+"\t"+N+"\t"+L);
			i+=N;
		}
		return traffic;
	}
		

	
}

