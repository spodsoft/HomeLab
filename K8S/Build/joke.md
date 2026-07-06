docker build -t joke-app:1.0 .

kubectl apply -f deployment.yaml

Expect:
deployment.apps/joke-deployment created

Verify POD created
kubectl get pods


kubectl apply -f service.yaml

