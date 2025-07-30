### Apply storageclass using (local-path)
```
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl apply -f storageclass.yaml
```

### Deploying using
```
kubectl apply -f namespace.yaml
kubectl apply -f storageclass.yaml     # Only if using local-path
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```