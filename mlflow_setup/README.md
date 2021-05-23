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