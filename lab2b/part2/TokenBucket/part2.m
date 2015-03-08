%read file file
[Sink_Time,Sink_Size] = textread('out4.txt','%f %f');
[Bucket_Arrival_Time,Bucket_Arrival_Size,backlog,token] = textread('../bucket4.txt','%f %f %f %f');

%token = zeros(10000,1);
%token = token + 100;
%backlog = zeros(10000,1);


%[Sink_Time1,Sink_Size1] = textread('out2.txt','%f %f');
%[Bucket_Arrival_Time1,Bucket_Arrival_Size1,backlog1,token1] = textread('../bucket2.txt','%f %f %f %f');

%[Sink_Time2,Sink_Size2] = textread('out3.txt','%f %f');
%[Bucket_Arrival_Time2,Bucket_Arrival_Size2,backlog2,token2] = textread('../bucket3.txt','%f %f %f %f');

%find cumulate value
Sink_Time = cumsum(Sink_Time)/1000;
Sink_Size = cumsum(Sink_Size);
Bucket_Arrival_Time = cumsum(Bucket_Arrival_Time)/1000;
Bucket_Arrival_Size = cumsum(Bucket_Arrival_Size);

%Sink_Time1 = cumsum(Sink_Time1);
%Sink_Size1 = cumsum(Sink_Size1);
%Bucket_Arrival_Time1 = cumsum(Bucket_Arrival_Time1);
%Bucket_Arrival_Size1 = cumsum(Bucket_Arrival_Size1);

%Sink_Time2 = cumsum(Sink_Time2);
%Sink_Size2 = cumsum(Sink_Size2);
%Bucket_Arrival_Time2 = cumsum(Bucket_Arrival_Time2);
%Bucket_Arrival_Size2 = cumsum(Bucket_Arrival_Size2);

%parameters
T = 2500/1000;
N = 10;
L = 100;
n = 10000;
tot_Time = n/N*T;
t = linspace(1,tot_Time,tot_Time);
accArrival = ceil(t/T)*N*L;

%N1 = 10;
%tot_Time1 = n/N1*T;
%t1 = linspace(1,tot_Time1,tot_Time1);
%accArrival1 = ceil(t1/T)*N1*L;

%figure(1);
%plot(t,accArrival,'r');
%hold all;
%plot(Bucket_Arrival_Time,Bucket_Arrival_Size,'c','LineWidth',3);
%hold all;
%plot(Sink_Time,Sink_Size);
%title('Plot 2.1 Cumulative Arrivals at Traffic Generator, Token Bucket and Traffic Sink with Source Rate < TBRate, N =1, TBSize = 100 Bytes');
%xlabel('Time (msec)');
%ylabel('Packet Size Sent (Bytes)');
%legend('Traffic Generator Data','Token Bucket Data','Traffic Sink data')

%figure(2);
%plot(Bucket_Arrival_Time,backlog,'c');
%hold;
%plot(Bucket_Arrival_Time,token,'r');
%title('Plot2.1.1 Content of the Token Bucket and the Backlog as a function of time');
%xlabel('Time (msec)');
%ylabel('number of token/number of bytes in backlog');
%ylim([-100,200])
%legend('Content of the backlog','Content of the token bucket');

%figure(3);
%plot(t,accArrival,'r');
%hold all;
%plot(Bucket_Arrival_Time,Bucket_Arrival_Size,'c','LineWidth',3);
%hold all;
%plot(Sink_Time,Sink_Size);
%title('Plot 2.2 Cumulative Arrivals at Traffic Generator, Token Bucket and Traffic Sink with Source Rate < TBRate, N =10, TBSize = 500 Bytes');
%xlabel('Time (msec)');
%ylabel('Packet Size Sent (Bytes)');
%legend('Traffic Generator Data','Token Bucket Data','Traffic Sink data')

%figure(4);
%plot(Bucket_Arrival_Time,backlog,'c');
%hold;
%plot(Bucket_Arrival_Time,token,'r');
%title('Plot2.2.1 Content of the Token Bucket and the Backlog as a function of time');
%xlabel('Time (msec)');
%ylabel('number of token/number of bytes in backlog');
%ylim([-100,600])
%legend('Content of the backlog','Content of the token bucket');

%figure(5);
%plot(t,accArrival,'r');
%hold all;
%plot(Bucket_Arrival_Time,Bucket_Arrival_Size,'c','LineWidth',3);
%hold all;
%plot(Sink_Time,Sink_Size);
%title('Plot 2.3 Cumulative Arrivals at Traffic Generator, Token Bucket and Traffic Sink with Source Rate ~ TBRate, N =1, TBSize = 100 Bytes');
%xlabel('Time (msec)');
%ylabel('Packet Size Sent (Bytes)');
%legend('Traffic Generator Data','Token Bucket Data','Traffic Sink data')

%figure(6);
%plot(Bucket_Arrival_Time,backlog,'c');
%hold;
%plot(Bucket_Arrival_Time,token,'r');
%title('Plot2.3.1 Content of the Token Bucket and the Backlog as a function of time');
%xlabel('Time (msec)');
%ylabel('number of token/number of bytes in backlog');
%ylim([-100,inf])
%legend('Content of the backlog','Content of the token bucket');

figure(5);
plot(t,accArrival,'r');
hold all;
plot(Bucket_Arrival_Time,Bucket_Arrival_Size,'c','LineWidth',3);
hold all;
plot(Sink_Time,Sink_Size);
title('Plot 2.4 Cumulative Arrivals at Traffic Generator, Token Bucket and Traffic Sink with maximum arrival rate of traffic');
xlabel('Time (msec)');
ylabel('Packet Size Sent (Bytes)');
legend('Traffic Generator Data','Token Bucket Data','Traffic Sink data')

figure(6);
plot(Bucket_Arrival_Time,backlog,'c');
hold;
plot(Bucket_Arrival_Time,token,'r');
title('Plot2.4.1 Content of the Token Bucket and the Backlog as a function of time');
xlabel('Time (msec)');
ylabel('number of token/number of bytes in backlog');
ylim([-100,inf])
legend('Content of the backlog','Content of the token bucket');

