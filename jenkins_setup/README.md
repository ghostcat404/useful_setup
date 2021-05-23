# Jenkins ubuntu installation guide

## Installation
- Add keys
```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

- Add repo
```
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

- Installation
```
sudo apt-get update && sudo apt-get install jenkins
```

## Jenkins start
- Make service accessible
```
sudo systemctl daemon-reload
```

- Start jenkins service
```
sudo systemctl start jenkins
```

- Check status
```
sudo systemctl status jenkins
```

### Optional: Add jenkins to docker group
If you need to be able to use docker as an agent in jenkins run code below
```
sudo gpasswd -a jenkins docker
```

## Configure Jenkinks with SSL using an NGINX Reverse Proxy

- First of all you need to [install nginx](nginx_install/README.md)


## TODO:
- [ ] Add self signed certs and nginx reverse proxy server