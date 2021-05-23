# Install nginx in Ubuntu 20.04 LTS
See [this link](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04#step-5-–-setting-up-server-blocks-(recommended))

## Installation

- Install
```
sudo apt-get update && sudo apt-get install nginx
```

- Enable Firewall
```
sudo ufw enable
sudo ufw allow OpenSSH
```

- Check firewall list
```
sudo ufw app list
```

- Allow nginx HTTPS and HTTP
```
sudo ufw allow 'Nginx Full'
```