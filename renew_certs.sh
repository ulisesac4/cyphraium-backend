# generate certs
sudo certbot certonly -d cyphraium.com 

# stop app
sudo systemctl stop cyphraium.service 

#remove old certs

sudo rm -rf /home/cyphraium/Applications/Cyphraium/certs/*

# copy certs to neccesary folder
sudo cp -r /etc/letsencrypt/archive/cyphraium.com/. /home/cyphraium/Applications/Cyphraium/certs

# do not forget to change permissions
sudo chown -R cyphraium:cyphraium /home/cyphraium/Applications/Cyphraium/certs

# reboot app
sudo systemctl start cyphraium.service 





