h1 firefox http://www.cs.colostate.edu/helpdocs/JavaHowe.html >> /home/swaroop/Documents/results4.txt &
h2 sleep 0.05m
h2 google-chrome http://www.google.com >> /home/swaroop/Documents/results1.txt &
h1 sleep 0.05m
h3 firefox http://www.facebook.com >> /home/swaroop/Documents/results1.txt &
h3 sleep 0.05m
h3 ping h2 &
h1 firefox http://www.cs.colostate.edu/helpdocs/JavaHowe.html >> /home/swaroop/Documents/results4.txt &
h2 sleep 0.05m
h2 firefox http://www.google.com >> /home/swaroop/Documents/results1.txt &
h1 sleep 0.05m
h2 firefox http://www.facebook.com >> /home/swaroop/Documents/results1.txt &
h4 sleep 0.05m
h3 ping h1 &
h4 ping h2 &
h2 ping h1 &
h4 ping h3 &
h4 ping h1 &
h1 ping h3 &
h1 ping -c4 h2 &
h4 ping h2 &
h2 ping h4 &
h1 ping h3 &
h2 ping h4 &
h3 ping h2 &
h3 ping -c2 h2





