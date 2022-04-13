# generate certs
sudo certbot certonly --standalone -d cyphraium.com  --agree-tos

# stop app
sudo systemctl stop cyphraium.service 

# copy certs to neccesary folder
sudo cp /etc/letsencrypt/live/cyphraium.com/* /home/cyphraium/Application/Cyphraium/certs

# do not forget to change permissions
sudo chown -R cyphraium:cyphraium /home/cyphraium/Application/Cyphraium/certs

# reboot app
sudo systemctl start cyphraium.service 