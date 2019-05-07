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


