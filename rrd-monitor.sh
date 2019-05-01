##Author Sean Mancini
##Purpose This script will monitor a RRD  file to ensure it is being updated to ensure graphing is working
#Version 1.0

#/bin/bash

##User settings
path_to_rrd="i.e /var/www/html/cacti/rra/xyzhost.rrd"
logging_file=" i.e /var/log/mylog.txt"
email_address="" #future 


##Get details from rrdtool
rrd_update="$(rrdtool lastupdate   $path_to_rrd  | awk '{print$1}'   | grep -o '[0-9]\+')"
rrd_lastupdate=$rrd_update
if [ $rrd_update == $rrd_lastupdate ]
 then 
  i=0
else 
 i=1
  fi


##Logging
if [ $i == 1 ]
 then
echo "Graphs are not updating"   $('date')  >> $logging_file
echo "RRD GRAPHS ARE NOT UPDATING!!!" | ssmtp $email_address
 else 
echo "Graphs are updating"   $('date')  >> $logging_file
fi







