[Sequence,Poisson_Time,Poisson_Size] = textread('poisson3.data','%f %f %f');
[Output_Time,Output_Size] = textread('out_ex2.1.data','%f %f');
[Output_Time_impr,Output_Size_impr] = textread('out_ex2.1_impr.data','%f %f');

Output_Time_impr=cumsum(Output_Time_impr);

diff_Time = Output_Time(1:10000) - Poisson_Time(1:10000);

%calculate packet loss
packet_loss = Poisson_Size - Output_Size;
packet_loss_impr = Poisson_Size(1:10000) - Output_Size_impr(1:10000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Before improvement
figure(1);
plot(Output_Time(1:10000),Output_Size(1:10000),'b',Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
%hold;
%plot(Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
title('Plot2.1 Poisson Data Input and Traffic Sink Output (10,000 pts) before improvement');
xlabel('Time (usec)');
ylabel('Size (Byte)');
legend('Traffic Sink Output','Poisson Data Input')

figure(11);
plot(diff_Time(1:10000))

%plot packet loss
figure(2);
plot(Output_Time_impr(1:10000),packet_loss_impr(1:10000));
title('Plot2.4 Packet loss of all time after improvement');
xlabel('Time (usec)');
ylabel('Size (Byte)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%After improvement
figure(3);
plot(Output_Time_impr(1:10000),Output_Size_impr(1:10000),'b',Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
%hold;
%plot(Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
title('Plot2.3 Poisson Data Input and Traffic Sink Output (10,000 pts) after improvement');
xlabel('Time (usec)');
ylabel('Size (Byte)');
legend('Improved Traffic Sink Output','Poisson Data Input')

figure(4);
plot(Output_Time_impr(1:10000),Output_Size_impr(1:10000),'b',Poisson_Time(1:10000),Poisson_Size(1:10000),'r',Output_Time(1:10000),Output_Size(1:10000),'c');
%hold all;
%plot(Poisson_Time(1:10000),Poisson_Size(1:10000));
%hold all;
%plot(Output_Time(1:10000),Output_Size(1:10000),'c');
title('Plot2.4 Traffic Sink Output improvement');
xlabel('Time (usec)');
ylabel('Size (Byte)');
legend('Improved Traffic Sink Output','Poisson Data Input','Traffic Sink Output before Improvement')
