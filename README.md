# rrd-monitor

This is a simple script to monitor RRD graph updates
The script will use the RRDtool lastupdate command to compare 
the update values if they are the same things are good
if no change then the graph has not updated

The script will logg to /var/log/rrd-monitor.log 


TODO 
Logic to send a email if an error is seen<br>
Echo status into Cacti log<br>
other stuff ???

