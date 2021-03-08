sudo tcpdump 'host student.cosy.sbg.ac.at and port 443' -w dump.pcap > /dev/null 2>&1 & disown
sleep 1
for i in {1..10}; do
	curl -s https://student.cosy.sbg.ac.at/~dhorn/file -o /dev/null
done

sleep 1
sudo pkill tcpdump

tcptrace -Szxy dump.pcap
