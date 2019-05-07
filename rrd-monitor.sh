##Author Sean Mancini
##Purpose This script will monitor a RRD  file to ensure it is being updated to ensure graphing is working
#Version 1.0

#/bin/bash



##User settings
path_to_rrd="/var/www/html/cacti/rra/local_linux_machine_loss_101.rrd"
logging_file="/var/www/html/cacti/log/cacti.log"
enable_email="" # enter Y to enable
email_address="sean.mancini@rci.rogers.com" 


##Get details from rrdtool
rrd_update="$(rrdtool lastupdate   $path_to_rrd  | awk '{print$1}'   | grep -o '[0-9]\+')"
sleep 30
rrd_lastupdate="$(rrdtool lastupdate   $path_to_rrd  | awk '{print$1}'   | grep -o '[0-9]\+')"

   if [[ "$rrd_update" = "$rrd_lastupdate" ]]
    then 
      i=1
     echo "equal"
       else 
        i=0
          fi

##Logging messeges
if [ $i == 1 ]
 then
#echo "Graphs are not updating"   $('date')  >> $logging_file
echo $('date') "WARNING: Graphs are not updating"     >> $logging_file ##Uncomment this line to showup nicely in cacti log
 else 
#echo "Graphs are updating"   $('date')  >> $logging_file
echo $('date') "SYSTEM STATS: Graphs are updating"     >> $logging_file ##Uncomment this line to showup nicely in cacti log
fi


###Email alarm to admin (requires ssmtp)

if [ $i == 1 ] && [ $enable_email == "y" ]
then (echo "Subject: !!!Cacti Graphing Alert!!!"; echo "From: "email" "; echo "To: Me <$email_address>"; echo ""; echo "Graphs are not updating") | /usr/sbin/ssmtp  -vv $email_address



fi






