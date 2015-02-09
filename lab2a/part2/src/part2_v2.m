[Sequence,Poisson_Time,Poisson_Size] = textread('poisson3.data','%f %f %f');
[Output_Time,Output_Size] = textread('out_ex2.1.data','%f %f');
[Output_Time_impr,Output_Size_impr] = textread('out_ex2.1_impr.data','%f %f');

Output_Time_impr=cumsum(Output_Time_impr);

%figure(1);
%plot(Output_Time(1:10000),linspace(1,10000,10000),'b');
%hold;
%plot(Poisson_Time(1:10000),linspace(1,10000,10000),'r');
%title('Plot2.1.1 Poisson Data Input and Traffic Sink Output (10,000 pts) as a function of time before improvement');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Traffic Sink Output','Poison Data Input')

Output_Size = cumsum(Output_Size);
Poisson_Size = cumsum(Poisson_Size);

figure(1);
plot(Output_Time(1:10000),Output_Size(1:10000),'b');
hold;
plot(Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
title('Plot2.1.1 Poisson Data Input and Traffic Sink Output as a function of time before improvement');
xlabel('Time (usec)');
ylabel('Packet Size Sent (Bytes)');
legend('Traffic Sink Output','Poison Data Input')

%figure(2);
%plot(Output_Time_impr(1:10000),linspace(1,10000,10000),'b');
%hold;
%plot(Poisson_Time(1:10000),linspace(1,10000,10000),'r');
%title('Plot2.2.1 Poisson Data Input and Traffic Sink Output (10,000 pts) as a function of time after improvement');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Improved Traffic Sink Output','Poison Data Input')

Output_Size_impr = cumsum(Output_Size_impr);

figure(2);
plot(Output_Time_impr(1:10000),Output_Size_impr(1:10000),'b');
hold;
plot(Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
title('Plot2.2.1 Poisson Data Input and Traffic Sink Output as a function of time after improvement');
xlabel('Time (usec)');
ylabel('Packet Size Sent (Bytes)');
legend('Improved Traffic Sink Output','Poison Data Input')

%figure(3);
%plot(Output_Time_impr(1:10000),linspace(1,10000,10000),'c');
%hold all;
%plot(Output_Time(1:10000),linspace(1,10000,10000),'b');
%hold all;
%plot(Poisson_Time(1:10000),linspace(1,10000,10000),'r');
%title('Plot2.3.1 Traffic Sink Output improvement as a function of time');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Traffic Sink Output','Poison Data Input','Improved Traffic Sink Output')

figure(3);
plot(Output_Time(1:10000),Output_Size(1:10000),'b');
hold all;
plot(Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
hold all;
plot(Output_Time_impr(1:10000),Output_Size_impr(1:10000),'c');
title('Plot2.3.1 Traffic Sink Output improvement as a function of time');
xlabel('Time (usec)');
ylabel('Packet Size Sent (Bytes)');
legend('Traffic Sink Output','Poison Data Input','Improved Traffic Sink Output')

%figure(4);
%diff_Time = Output_Time(1:10000) - Output_Time_impr(1:10000);
%plot(linspace(1,10000,10000),diff_Time(1:10000));
%title('Plot2.3.2 Time different between the two outputs(After-before)');
%ylabel('Time (usec)');
%xlabel('Packet Sequence number');

Diff = diff(Output_Time_impr);
Diff = cumsum(Diff);
figure(4);
plot(Diff)