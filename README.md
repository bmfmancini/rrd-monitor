# rrd-monitor

This is a simple script to monitor RRD graph updates
The script will use the RRDtool lastupdate command to compare 
the update values if they are the same things are good
if no change then the graph has not updated
 



HOW TO:

Put the script into your directory of choice 
change the logging path to either your cacti log or something else 

if using cacti uncomment <br>
##"WARNING:Graphs are not updating"   $('date')  >> $logging_file ##Uncomment this line to showup nicely in cacti log <br>
This allows the line to show up nicely in the cacti log view <br>
put a entry into your cron to run at the interveral you want to do your checks


# Cacti Specific

# If using 1 Minute polls 

*/2 * * * *  /bin/bash   /rrd_monitor/rrd-monitor.sh >> /tmp/log.txt

# if using 5 minute polls 

*/10 * * * *   /bin/bash  /root/rrd-monitor.sh

set sleep time in script from 30 to 300 to account for the 5 minute polling time between the first reading and the second


