import java.io.*; 
import java.util.*; 

/* 
 *  The program reads an input file "data.txt"  that has entries of the form 
 *  0	0.000000	I	536	98.190	92.170	92.170
 *  4	133.333330	P	152	98.190	92.170	92.170
 * 	1	33.333330	B	136	98.190	92.170	92.170
 *
 * The file is read line-by-line, values are parsed and assigned to variables,
 * values are  displayed, and then written to a file with name "output.txt"  
 */

class TrafficGenerator_impr {  
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
		long last_frame_time = 0;

		try {  
			
			/*
			 * Open input file as a BufferedReader
			 */ 
			File fin = new File("short_poisson.data");
			FileReader fis = new FileReader(fin);
			bis = new BufferedReader(fis);
			Sender mySender = new Sender("127.0.0.1");
			int tag_str = Integer.parseInt(args[0]);
			byte tag = 0x0;
			if (tag_str == 1){
				tag = 0x01;
			} else if (tag_str == 5){
				tag = 0x02;
			} else if (tag_str == 9){
				tag = 0x03;
			} else {
				System.out.println("bad N");
			}
			
			/*
			 * Open file for output 
			 */
			FileOutputStream fout =  new FileOutputStream("generator.txt");
			pout = new PrintStream (fout);
			
			ArrayList<String> input_content = new ArrayList<String>();
			while ( (currentLine = bis.readLine()) != null) { 
				input_content.add(currentLine);
			
			}
			System.out.println("finshied reading");
			/*
			 *  Read file line-by-line until the end of the file 
			 */
                        for (String _currentLine: input_content) {
				
				/*
				 *  Parse line and break up into elements 
				 */
				StringTokenizer st = new StringTokenizer(_currentLine); 
				String col1 = st.nextToken(); 
				String col2 = st.nextToken(); 
				String col3  = st.nextToken(); 

				int SeqNo = Integer.parseInt(col1);
				Long Ftime = Long.parseLong(col2);
				int Fsize = Integer.parseInt(col3);
				Long N_scale = Long.parseLong(args[0]);
//				Ftime = Ftime / N_scale;
				/*
				 *  Write line to output file 
				 */
				long time_delta = Ftime - last_frame_time;
				time_delta = time_delta / N_scale;
				long timer = 0;
				long start_time = System.nanoTime();
				while ((System.nanoTime() - start_time)/1000 < time_delta){;}
				long waited = System.nanoTime() - start_time;
				last_frame_time = Ftime;
				
				mySender.send(Fsize, tag);
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
}

