# ML Flow

## Installation
```
sudo pip3 install mlflow
```

## Usage
see example in this [tutorial](https://www.mlflow.org/docs/latest/tutorials-and-examples/index.html)


## Run mlflow server as linux system service
1. Create file ```/etc/init.d/mlflowstart.sh``` with following content
```bash
#!/bin/sh
if [ $1 = 'start' ]
then
    mlflow server --default-artifact-root /home/<user_name>/path/to/artifacts/folder --host 0.0.0.0
fi
```
Create folder where you will be store artifacts and models or use existing storage.

2. Create file ```/usr/lib/systemd/system/mlflow.service``` with the following content
```conf
[Unit]
Description=mlflow service

[Service]
Type=simple
ExecStart=/etc/init.d/mlflowstart.sh start

[Install]
WantedBy=mutil-user.target
```

3. Restart daemon
```
sudo systemctl daemon-reload
```

4. Start mlflow
```
sudo systemctl start mlflow
```

5. Check status
```
sydo systemctl status mlflow
```
**Output should be:**
```
● mlflow.service - mlflow service
     Loaded: loaded (/lib/systemd/system/mlflow.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2021-05-23 15:32:27 MSK; 15min ago
   Main PID: 109970 (mlflowstart.sh)
      Tasks: 11 (limit: 4703)
     Memory: 387.6M
```

## Get authentification via nginx

First of all please check nginx [install](nginx_install/install/README.md) and [ssl setup](nginx_install/ssl_setup/README.md)

1. Install utils
```
sudo apt-get install apache2-utils
```

2. Create ```apache2``` directory
```
sudo mkdir /etc/apache2
```

3. Create user
```
sudo htpasswd -c /etc/apache2/.htpasswd user1
```

4. Finally, Let's make some changes in our ```/etc/nginx/sites-available/example.com``` file

```
server {
    listen <YOUR_PORT> ssl; # for example 9000
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    server_name <YOUR_SERVER_IP_ADRESS>;

    location / {
        proxy_pass http://localhost:5000; # where 5000 -- default mlflow port
        include /etc/nginx/proxy_params;
        proxy_redirect off;
    }
}
server {
    listen 80;
    listen [::]:80;

    server_name <YOUR_SERVER_IP_ADRESS>;

    return 302 https://$server_name$request_uri;
}
```
5. Allow your port in Firewall if you use it
```
sudo ufw allow '<YOUR_PORT>/tcp'
```

6. Now restart mlflow service and nginx service
```
sudo systemctl restart nginx && sudo systemctl restart mlflow
```

7. Open ```https://<YOUR_SERVER_IP_ADRESS>:<YOUR_PORT>``` and enter credential from point 3.