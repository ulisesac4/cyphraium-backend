# generate certs
sudo certbot certonly -d cyphraium.com 

# stop app
sudo systemctl stop cyphraium.service 

#remove old certs

sudo rm -rf /home/cyphraium/Application/Cyphraium/certs/.

# copy certs to neccesary folder
sudo cp /etc/letsencrypt/live/cyphraium.com/. /home/cyphraium/Application/Cyphraium/certs

# do not forget to change permissions
sudo chown -R cyphraium:cyphraium /home/cyphraium/Application/Cyphraium/certs

# reboot app
sudo systemctl start cyphraium.service 