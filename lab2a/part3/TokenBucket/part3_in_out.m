[Sequence,Poisson_Time,Poisson_Size] = textread('poisson3.data','%f %f %f');
[Sink_Arrival_Time,Sink_Arrival_Size] = textread('out_poisson.data','%f %f');
[Bucket_Arrival_Time,Bucket_Arrival_Size,backlog,token] = textread('../bucket_poisson.txt','%f %f %f %f');

[Sequence,Video_Time,type,Video_Size,a,b,c] = textread('short_movie.data','%f %f %s %f %f %f %f');
[Sink_Arrival_Time_Video,Sink_Arrival_Size_Video] = textread('out_video.data','%f %f');
[Bucket_Arrival_Time_Video,Bucket_Arrival_Size_Video,backlog,token] = textread('../bucket_video.txt','%f %f %f %f');

[Ether_Time,Ether_Size] = textread('short_ether.data','%f %f');
[Sink_Arrival_Time_Ether,Sink_Arrival_Size_Ether] = textread('out_ether.data','%f %f');
[Bucket_Arrival_Time_Ether,Bucket_Arrival_Size_Ether,backlog,token] = textread('../bucket_ether.txt','%f %f %f %f');

Bucket_Arrival_Time = cumsum(Bucket_Arrival_Time);
Sink_Arrival_Time = cumsum(Sink_Arrival_Time);
Bucket_Arrival_Time_Video = cumsum(Bucket_Arrival_Time_Video);
Sink_Arrival_Time_Video = cumsum(Sink_Arrival_Time_Video);
Bucket_Arrival_Time_Ether = cumsum(Bucket_Arrival_Time_Ether);
Sink_Arrival_Time_Ether = cumsum(Sink_Arrival_Time_Ether);

Ether_Time = Ether_Time * 1000000;

%figure(12);
%plot(Video_Time(1:10000),Video_Size(1:10000),'r',Bucket_Arrival_Time_Video(1:10000),Bucket_Arrival_Size_Video(1:10000),'c',Sink_Arrival_Time_Video(1:10000),Sink_Arrival_Size_Video(1:10000),'b');
%title('Plot3.1 Data of Trace File, Arrivals at Token Bucket, and Arrivals at Traffic Sink(10,000 pts)');
%xlabel('Time (usec)');
%ylabel('Size (Byte)');
%legend('Poisson Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

%figure(1);
%plot(Poisson_Time(1:10000),linspace(1,10000,10000),'r');
%hold all;
%plot(Bucket_Arrival_Time(1:10000),linspace(1,10000,10000),'c');
%hold all;
%plot(Sink_Arrival_Time(1:10000),linspace(1,10000,10000),'b--');
%title('Plot3.1 Possion Data Input, Bucket Arrival and Sink Arrival as a function of time');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Poisson Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

Poisson_Size = cumsum(Poisson_Size);
Bucket_Arrival_Size = cumsum(Bucket_Arrival_Size);
Sink_Arrival_Size = cumsum(Sink_Arrival_Size);

figure(1);
plot(Poisson_Time(1:10000),Poisson_Size(1:10000),'r');
hold all;
plot(Bucket_Arrival_Time(1:10000),Bucket_Arrival_Size(1:10000),'c');
hold all;
plot(Sink_Arrival_Time(1:10000),Sink_Arrival_Size(1:10000),'b--');
title('Plot3.1 Possion Data Input, Bucket Arrival and Sink Arrival as a function of time');
xlabel('Time (usec)');
ylabel('Packet Size Sent (Bytes)');
legend('Poisson Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

figure(2);
plot(Bucket_Arrival_Time(1:10000),backlog(1:10000),'b');
hold;
plot(Bucket_Arrival_Time(1:10000),token(1:10000),'r');
title('Plot3.1.1 Possion Data Content of the Token Bucket and the Backlog as a function of time');
xlabel('Time (usec)');
ylabel('number of token/number of bytes in backlog');
legend('Content of the backlog','Content of the token bucket');
xlim([0,10000]);
ylim([-1000,11000]);

%figure(3);
%plot(Video_Time(1:10000),linspace(1,10000,10000),'r');
%hold all;
%plot(Bucket_Arrival_Time_Video(1:20000),linspace(1,20000,20000),'c');
%hold all;
%plot(Sink_Arrival_Time_Video,linspace(1,length(Sink_Arrival_Time_Video),length(Sink_Arrival_Time_Video)),'b--');
%title('Plot3.2 Video Data Input, Bucket Arrival and Sink Arrival as a function of time');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Video Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

Video_Size = cumsum(Video_Size);
Bucket_Arrival_Size_Video = cumsum(Bucket_Arrival_Size_Video);
Sink_Arrival_Size_Video = cumsum(Sink_Arrival_Size_Video);

figure(3);
plot(Video_Time,Video_Size,'r');
hold all;
plot(Bucket_Arrival_Time_Video,Bucket_Arrival_Size_Video,'c');
hold all;
plot(Sink_Arrival_Time_Video,Sink_Arrival_Size_Video,'b--');
title('Plot3.2 Video Data Input, Bucket Arrival and Sink Arrival as a function of time');
xlabel('Time (usec)');
ylabel('Packet Size Sent (Bytes)');
legend('Video Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

%figure(4);
%plot(Ether_Time(1:10000),linspace(1,10000,10000),'r');
%hold all;
%plot(Bucket_Arrival_Time_Ether(1:10000),linspace(1,10000,10000),'c');
%hold all;
%plot(Sink_Arrival_Time_Ether(1:10000),linspace(1,10000,10000),'b--');
%title('Plot3.3 Ethernet Data Input, Bucket Arrival and Sink Arrival as a function of time');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Ethernet Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

%%%%%%Y axis time 
%figure(4);
%plot(Ether_Time(1:10000),linspace(1,10000,10000),'r');
%hold all;
%plot(Bucket_Arrival_Time_Ether,linspace(1,length(Bucket_Arrival_Time_Ether),length(Bucket_Arrival_Time_Ether)),'c');
%hold all;
%plot(Sink_Arrival_Time_Ether,linspace(1,length(Sink_Arrival_Time_Ether),length(Sink_Arrival_Time_Ether)),'b--');
%title('Plot3.3 Ethernet Data Input, Bucket Arrival and Sink Arrival as a function of time');
%xlabel('Time (usec)');
%ylabel('Packet Sequence number');
%legend('Ethernet Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )


Ether_Size = cumsum(Ether_Size);
Bucket_Arrival_Size_Ether = cumsum(Bucket_Arrival_Size_Ether);
Sink_Arrival_Size_Ether = cumsum(Sink_Arrival_Size_Ether);

%%%%%%%%%% y axis size
figure(4);
plot(Ether_Time(1:10000),Ether_Size(1:10000),'r');
hold all;
plot(Bucket_Arrival_Time_Ether,Bucket_Arrival_Size_Ether,'c');
hold all;
plot(Sink_Arrival_Time_Ether,Sink_Arrival_Size_Ether,'b--');
title('Plot3.3 Ethernet Data Input, Bucket Arrival and Sink Arrival as a function of time');
xlabel('Time (usec)');
ylabel('Packet Size sent (Bytes)');
legend('Ethernet Data Input','Arrival at Token Bucket','Arrival at Traffic Sink' )

