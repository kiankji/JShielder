#How to install ffmpeg

sudo apt-get install ffmpeg
whereis ffprobe

ffprobe: /usr/bin/ffprobe /usr/share/man/man1/ffprobe.1.gz
/usr/bin/ffprobe -> .env

whereis ffmpeg
ffmpeg: /usr/bin/ffmpeg /usr/share/ffmpeg /usr/share/man/man1/ffmpeg.1.gz


#Horizon 
php artisan horizon

#Migration von Daten

php artisan migrate:refresh --seed


#Queues

php artisan queue:work --queue=video
php artisan queue:work --queue=image


php artisan queue:work --queue=email

#Löschen der Queue
redis-cli
FLUSHDB


#Server

##Installing Docker
´´´
apt install docker.io -y
systemctl start docker
systemctl enable docker

curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
mkdir /var/project

´´´

### List of all services
service --status-all

### Firewall

´´´
ufw reset
ufw reload
ufw allow www
ufw allow ssh 
ufw allow http
ufw allow https
ufw allow 22
ufw allow 372
ufw allow 372/tcp
ufw allow 80
ufw allow 80/tcp
ufw allow 443
ufw allow 443/tcp
ufw allow 80/udp
ufw allow 443/udp
ufw allow from 89.163.132.113
ufw deny 6379
ufw default deny incoming 
ufw reload
ufw logging on
ufw enable
ufw reload
´´´

´´´
ufw --force enable
´´´
### Fail2ban

Status
´´´
fail2ban-client status
´´´

Status from Jail

´´´
fail2ban-client status <JAIL-NAME>
´´´


Unban
´´´
fail2ban-client set <JAIL-NAME> unbanip <IP-ADDRESS>
´´´

Ban IP
´´´
fail2ban-client set <JAIL-NAME> banip <IP-ADDRESS>
´´´

Blockedips
´´´
 iptables -L INPUT -v -n
´´´

### jShielder
´´´
cd /tmp
git clone https://github.com/Jsitech/JShielder.git
cd JShielder
./jshielder.sh
2
6

2
3
4
6
secrettalent
 ssh-keygen -t rsa -b 4096
 cat /home/secrettalent/.ssh/id_rsa.pub >> /home/secrettalent/.ssh/authorized_keys
 ssh-copy-id -i /root/.ssh/id_rsa.pub secrettalent@152.89.107.153

8
19
20
21
23
25
26

iptables -A INPUT -p tcp --destination-port 8379 -j DROP
service iptables save

iptables -L


 echo "iptables -A INPUT -p tcp -m tcp --dport $port -j ACCEPT" >> /etc/init.d/iptables.sh
´´´

### IPtables
nano /etc/init.d/iptables.sh
# Redis Server

iptables -A INPUT -p tcp --destination-port 8379 -j DROP

# TS Server / VPN

iptables -A INPUT -s 89.163.132.113 -j ACCEPT





### Fail2Ban
nano /etc/fail2ban/jail.conf
ignoreip = 127.0.0.1 89.163.132.113

/etc/init.d/fail2ban restart

#Docker

docker-compose up -d caddy redis php-worker

#Workspace

docker-compose exec workspace bash
composer install --optimize-autoloader --no-dev
php artisan config:cache
php artisan route:cache
php artisan key:generate
npm install
npm run prod



#Future:
Nginx statt caddy dafür mit lets encrypt 



