##Author Sean Mancini
##Purpose This script will monitor a RRD  file to ensure it is being updated to ensure graphing is working


#/bin/bash





##Get details from rrdtool

rrd_update="$(rrdtool lastupdate   /var/www/html/cacti/rra/local_linux_machine_loss_101.rrd  | awk '{print$1}'   | grep -o '[0-9]\+')"
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
echo "Graphs are not updating"   $('date')  >> /var/log/rrd-monitor.log
 else 
echo "Graphs are updating"   $('date')  >> /var/log/rrd-monitor.log
fi







