while true
do
	for i in `seq 21 99`
	do
		sudo service mirai stop
		echo `date` "killed mirai process"|tee -a /tmp/changeip.log
                sudo ps aux|grep mirai|tee -a /tmp/changeip.log
                ps -a -o pid -o cmd|grep curl.sh|grep demo|cut -d s -f1|xargs sudo kill
		echo `date` "killed curl process"|tee -a /tmp/changeip.log
		sed -ie "s/address 192.168.10.*/address 192.168.10.$i/g" /etc/network/interfaces
		/etc/init.d/networking restart
		echo `date` "restarted networking"|tee -a /tmp/changeip.log
                sudo /etc/init.d/curl start
		echo `date` "started curl"|tee -a /tmp/changeip.log
		sleep 120
		sudo service mirai start
		echo `date` "started mirai process"|tee -a /tmp/changeip.log
                sudo ps aux|grep mirai|tee -a /tmp/changeip.log
		sleep 1080
	done
done
