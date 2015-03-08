%read file file
%[P_seq,P_accuTime,P_Size] = textread('poisson3.data','%f %f %f');
[Sink_Time,Sink_Size] = textread('out2.txt','%f %f');
[Bucket_Arrival_Time,Bucket_Arrival_Size,backlog,token] = textread('../bucket2.txt','%f %f %f %f');

%find cumulate value
Sink_Time = cumsum(Sink_Time);
Sink_Size = cumsum(Sink_Size);
Bucket_Arrival_Time = cumsum(Bucket_Arrival_Time);
Bucket_Arrival_Size = cumsum(Bucket_Arrival_Size);

figure(1);
%plot(P_accuTime,P_Size,'r','LineWidth',3);
%hold all;
plot(Bucket_Arrival_Time,Bucket_Arrival_Size,'r','LineWidth',3);
hold all;
plot(Sink_Time,Sink_Size,'LineWidth',3);
title('Plot 3.1 Cumulative Arrivals at Token Bucket and Traffic Sink with Poission Data');
xlabel('Time (usec)');
ylabel('Packet Size Sent (Bytes)');
legend('Token Bucket Data','Traffic Sink data')

figure(2);
plot(Bucket_Arrival_Time,backlog,'c');
title('Plot3.1.1 Content of Backlog as a function of time');
xlabel('Time (usec)');
ylabel('number of bytes in backlog');

figure(3)
plot(Bucket_Arrival_Time,token,'r');
title('Plot3.1.2 Content of Token Bucket as a function of time');
xlabel('Time (usec)');
ylabel('number of tokens');
%ylim([0,1600])
%legend('Content of the backlog','Content of the token bucket');

max(Sink_Time)-max(P_accuTime)
