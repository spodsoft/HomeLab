# K8S Build and Deploy 

## Docker Build

Build joke-app

`docker build -t joke-app:1.0 .`

## K8S Deploy

`kubectl apply -f deployment.yaml`

Expect:
deployment.apps/joke-deployment created

Verify POD created
`kubectl get pods`

Deploy Service
`kubectl apply -f service.yaml`

