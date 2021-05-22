# Jenkins ubuntu installation guide

1. Add keys
```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

2. Add repo
```
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

3. Installation
```
sudo apt-get update && sudo apt-get install jenkins
```

4. Make service accessible
```
sudo systemctl daemon-reload
```

5. Start jenkins service
```
sudo systemctl start jenkins
```

6. Check status
```
sudo systemctl status jenkins
```