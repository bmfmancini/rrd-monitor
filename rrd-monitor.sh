##Author Sean Mancini
##Purpose This script will monitor a RRD  file to ensure it is being updated to ensure graphing is working
#Version 1.0

#/bin/bash

##User settings
path_to_rrd="/var/www/html/cacti/rra/local_linux_machine_loss_101.rrd"
logging_file="/var/www/html/cacti/log/cacti.log"
#enable_email="" # enter Y to enable
#email_address="enter email" 


##Get details from rrdtool
rrd_update="$(rrdtool lastupdate   $path_to_rrd  | awk '{print$1}'   | grep -o '[0-9]\+')"
 rrd_lastupdate=$rrd_update
   if [ $rrd_update == $rrd_lastupdate ]
    then 
      i=0
       else 
        i=1
          fi


##Logging messeges
if [ $i == 1 ]
 then
#echo "Graphs are not updating"   $('date')  >> $logging_file
echo "WARNING:Graphs are not updating"   $('date')  >> $logging_file ##Uncomment this line to showup nicely in cacti log
 else 
#echo "Graphs are updating"   $('date')  >> $logging_file
echo "SYSTEM STATS:Graphs are updating"   $('date')  >> $logging_file ##Uncomment this line to showup nicely in cacti log
fi


###Email alarm to admin

if [ $i == i ] && [ $enable_email == "y" ]
then echo "RRD GRAPHS ARE NOT UPDATING!!!" | ssmtp -vv $email_address
echo "123"
fi





