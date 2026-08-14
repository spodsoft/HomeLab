# MiniKube

From (https://minikube.sigs.k8s.io/docs/)

## Linux x86-64
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```


Start

`minikube start`

If kubectl installed `kubectl get po -A`

`minikube kubectl -- get po -A`

`minikube dashboard`
