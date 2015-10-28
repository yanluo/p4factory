xterm h1 h2 h3 h4
s1 START=$(date +"'%m/%d/%Y-%H:%M:%S.%N'")
h1 ping h2 >> /home/root/Documents/results1.txt &
h1 ping h2 >> /home/root/Documents/results2.txt &
h3 ping h3 >> /home/root/Documents/results3.txt &
h1 sleep 0.25m
h2 ping h4 >> /home/root/Documents/results4.txt &
h4 ping h1 >> /home/root/Documents/results5.txt &
h1 ping h2 >> /home/root/Documents/results1.txt &
h1 ping h2 >> /home/root/Documents/results2.txt &
h3 ping h3 >> /home/root/Documents/results3.txt &
h3 sleep 0.25m
h2 ping h4 >> /home/root/Documents/results4.txt &
h4 ping h1 >> /home/root/Documents/results5.txt &
h1 ping h2 >> /home/root/Documents/results1.txt &
h1 ping h2 >> /home/root/Documents/results2.txt &
h3 ping h3 >> /home/root/Documents/results3.txt &
h2 ping h4 >> /home/root/Documents/results4.txt &
s1 echo start_time=$START  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 echo curr_time=$TIME  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 echo flow_type=ftp---github.com---10.0.0.4---18.2301536642---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 echo flow_type=ftp---github.com---10.0.0.4---23.8899551858---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 dpctl dump-flows tcp:127.0.0.1:6634  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 /home/swaroop/sabine/tools/flow_parser.py -i /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 -o /home/swaroop/Documents/flow.json -s
h2 sleep 0.25m
h4 ping h1 >> /home/root/Documents/results5.txt &
h1 ping h2 >> /home/root/Documents/results1.txt &
h1 ping h2 >> /home/root/Documents/results2.txt &
h3 ping h3 >> /home/root/Documents/results3.txt &
h1 sleep 0.25m
h2 ping h4 >> /home/root/Documents/results4.txt &
h4 ping h1 >> /home/root/Documents/results5.txt &
h1 ping h2 >> /home/root/Documents/results1.txt &
h1 ping h2 >> /home/root/Documents/results2.txt &
h4 sleep 0.25m
h3 ping h3 >> /home/root/Documents/results3.txt &
h2 ping h4 >> /home/root/Documents/results4.txt &
h4 ping h1 >> /home/root/Documents/results5.txt &
h3 sleep 0.25m

