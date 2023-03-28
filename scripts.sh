# IP Tables 
# (Only SSH needed because other ports forwarded to Docker)
sudo iptables -A INPUT -p tcp --destination-port 2222 -j ACCEPT
sudo iptables -P INPUT DROP

# Mysql dump
echo "sudo docker exec maria mkdir /home/$(date +%F-%H-%M) && sudo docker exec maria mysqldump -u root -p --all-databases --result-file=/home/$(date +%F-%H-%M)/dump.sql" > dump.sh
crontab -e
0 2 * * * dump.sh

# 3 last modified file
sudo find /var/log -printf "%TY-%Tm-%Td %TT %p\n" | sort -n | head -3 > "mod-$(date +%F).out"

# Modified files in last five days
sudo find /var/log -mtime -5 -type f > "last_five-$(date +%F)"

# loadavg
uptime |  awk '{print $(NF)}'

# Change <title>
echo "<title>About the Web</title>" > index.html
sed -i 's/<title>/Title:/g' index.html

# vim exit
:q! without save
:wq with save