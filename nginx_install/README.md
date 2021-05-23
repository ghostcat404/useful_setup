# Install nginx in Ubuntu 20.04 LTS
See [this link](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04#step-5-–-setting-up-server-blocks-(recommended))
```
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
```

## Installation

- Install
```
sudo apt-get update && sudo apt-get install nginx
```

- Check firewall list
```
sudo ufw app list
```

- Allow nginx HTTPS and HTTP
```
sudo ufw allow 'Nginx Full'
```

If you have your own domain name, you can follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04#step-5-–-setting-up-server-blocks-recommended) after installation and [this guide](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04) using Let's encrypt for ssl
