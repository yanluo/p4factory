xterm h1 h2 h3 h4
s1 START=$(date +"'%m/%d/%Y-%H:%M:%S.%N'")
h1 sleep 0.00m
h4 firefox http://www.cs.colostate.edu/helpdocs/JavaHowe.html >> /home/swaroop/Documents/results4.txt &
h1 sleep 0.25m
h2 libreoffice >> /home/swaroop/Documents/results2.txt &
h1 sleep 0.05m
h4 kill -9 $(pidof firefox)
h4 script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status README ; cd -' >> /home/swaroop/Documents/results4.txt &
h1 sleep 0.04m
h1 cat /home/swaroop/Documents/flow.xml >> /home/swaroop/Documents/results1.txt &
h1 sleep 0.02m
h3 cat /home/swaroop/Documents/flow.xml >> /home/swaroop/Documents/results3.txt &
h1 sleep 0.03m
h4 kill -9 $(pidof script)
h4 script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status target/flowcontrol-0.1.jar ; cd -' >> /home/swaroop/Documents/results4.txt &
h1 sleep 0.10m
s1 echo sw_num=1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 TIME=$(date +"'%m/%d/%Y-%H:%M:%S.%N'")
s1 echo start_time=$START  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 echo curr_time=$TIME  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 echo flow_type=ftp---github.com---10.0.0.4---18.2301536642---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 echo flow_type=ftp---github.com---10.0.0.4---23.8899551858---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 dpctl dump-flows tcp:127.0.0.1:6634  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 &
s1 /home/swaroop/sabine/tools/flow_parser.py -i /home/swaroop/Documents/flow.dat_2015_09_01_10_0_30 -o /home/swaroop/Documents/flow.json -s
h1 sleep 0.00m
h4 kill -9 $(pidof script)
h4 cat /home/swaroop/Documents/flow.xml >> /home/swaroop/Documents/results4.txt &
h1 sleep 0.05m
h1 kill -9 $(pidof cat)
h1 cat /home/swaroop/Documents/flow.xml >> /home/swaroop/Documents/results1.txt &
h1 sleep 0.03m
h3 kill -9 $(pidof cat)
h3 emacs /tmp/temp1.txt >> /home/swaroop/Documents/results3.txt &
h1 sleep 0.09m
h2 kill -9 $(pidof libreoffice)
h2 script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status README ; cd -' >> /home/swaroop/Documents/results2.txt &
h1 sleep 0.01m
h3 kill -9 $(pidof emacs)
h3 script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status pom.xml ; cd -' >> /home/swaroop/Documents/results3.txt &
h1 sleep 0.00m
h2 kill -9 $(pidof script)
h2 script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status target/flowcontrol-0.1.jar ; cd -' >> /home/swaroop/Documents/results2.txt &
h1 sleep 0.00m
h4 kill -9 $(pidof cat)
h4 cat /home/swaroop/Documents/flow.xml >> /home/swaroop/Documents/results4.txt &
h1 sleep 0.04m
h3 kill -9 $(pidof script)
h3 touch /tmp/temp1.txt >> /home/swaroop/Documents/results3.txt &
h1 sleep 0.02m
h1 kill -9 $(pidof cat)
h1 gcc /home/swaroop/C_scripts/HelloWorld.c >> /home/swaroop/Documents/results1.txt &
h1 sleep 0.02m
h2 kill -9 $(pidof script)
h2 libreoffice >> /home/swaroop/Documents/results2.txt &
h1 sleep 0.08m
h3 kill -9 $(pidof touch)
h3 gcc /home/swaroop/C_scripts/HelloWorld.c >> /home/swaroop/Documents/results3.txt &
h1 sleep 0.04m
h2 kill -9 $(pidof libreoffice)
h2 bc >> /home/swaroop/Documents/results2.txt &
h1 sleep 0.08m
h4 kill -9 $(pidof cat)
h4 script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status target/flowcontrol-0.1.jar ; cd -' >> /home/swaroop/Documents/results4.txt &
h1 sleep 0.03m
s1 echo sw_num=1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 TIME=$(date +"'%m/%d/%Y-%H:%M:%S.%N'")
s1 echo start_time=$START  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo curr_time=$TIME  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo flow_type=ftp---github.com---10.0.0.4---18.2301536642---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo flow_type=ftp---github.com---10.0.0.4---23.8899551858---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo flow_type=ftp---github.com---10.0.0.2---40.368197204---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo flow_type=ftp---github.com---10.0.0.3---40.7360552377---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo flow_type=ftp---github.com---10.0.0.2---41.0042371901---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 echo flow_type=ftp---github.com---10.0.0.4---58.3384030931---1  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 dpctl dump-flows tcp:127.0.0.1:6634  >> /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 &
s1 /home/swaroop/sabine/tools/flow_parser.py -i /home/swaroop/Documents/flow.dat_2015_09_01_10_0_58 -o /home/swaroop/Documents/flow.json -s
h1 kill -9 $(pidof gcc /home/swaroop/C_scripts/HelloWorld.c)
h2 kill -9 $(pidof bc)
h3 kill -9 $(pidof gcc /home/swaroop/C_scripts/HelloWorld.c)
h4 kill -9 $(pidof script -q -c 'cd /home/swaroop/sabine/apps/flowcontrol ; git status target/flowcontrol-0.1.jar ; cd -')
