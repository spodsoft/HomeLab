# Kubernetes Install

Instruction (https://kubernetes.io/docs/setup/prod)


Use Ubuntu ISO (https://ubuntu.com/download/server)

## Kubernetes install commands 

1. `sudo apt-get update`
2. `sudo apt-get install -y apt-transport-https ca-certificates curl gpg`
3. `curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.... | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg`
4. `echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.... /' | sudo tee /etc/apt/sources.list.d/kubernetes.list`
5. `sudo apt-get update`


The Install...

1. `sudo apt-get install -y kubelet kubeadm kubectl`
2. `sudo apt-mark hold kubelet kubeadm kubectl`
3. `sudo systemctl enable --now kubelet`


Containerd install commands → 

1. `sudo swapoff -a`
2. `sudo sed -i '/ swap / s/^/#/' /etc/fstab`
3. ```
cat EOF | sudo tee /etc/sysctl.d/k8s.conf # ADD TWO SMALLER AS
net.ipv4.ip_forward = 1
EOF
```
4. `sudo apt install -y containerd`
5. `sudo systemctl enable --now containerd`
6. ```
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemCgroup =false/SystemCgroup = true/' /etc/containerd/config.toml
sudo systemctl restart containerd
```
7. `ls /var/run/containerd/containerd.sock`

AFTER THAT

1. `ip route show`
2. ```
sudo kubeadm init \
--apiserver-advertise-address="YOURip" \
--pod-network-cidr="YOURcidr"
```
3. ```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
4. `kubectl apply -f https://raw.githubusercontent.com/fla...`
