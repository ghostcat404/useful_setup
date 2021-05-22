# Tutorial for minikube setup

## Prerequisites

### 1. Install kubectl

1. Download last version
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```

2. Make the kubectl binary executable
```
chmod +x ./kubectl
```

3. Move kubectl to PATH directory
```
sudo mv ./kubectl /usr/local/bin/kubectl
```

4. Check access
```
kubectl version --client
```

### 2. Install hypervisor
0. Check that you can use virtualization
```
egrep -c ' lm ' /proc/cpuinfo
```
Output should be **1 or more**

1. Install prerequisites
```
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
```

2. Add user to groups
```
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
```
3. Verify installation
```
virsh list --all
```

## Installation minikube

Check the [Installation guide](https://minikube.sigs.k8s.io/docs/start/) if your system does not Ubuntu

Below is the commands for Ubuntu 20.04 LTS

1. Get binary
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

2. Install
```
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

3. Install dnsmasq
```
sudo apt-get install dnsmasq
```

## Run

1. Create and run cluster
```
minikube start --vm-driver=kvm2
```

2. Check status
```
minikube status
```