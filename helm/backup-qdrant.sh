#!/bin/bash
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backup/qdrant_$TIMESTAMP"

# Create snapshots via API
for pod in $(kubectl get pods -n qdrant -l app.kubernetes.io/name=qdrant -o jsonpath='{.items[*].metadata.name}'); do
  kubectl exec -n qdrant $pod -- curl -X POST "http://localhost:6333/snapshots"
done

# Copy snapshots from persistent volumes
kubectl exec -n qdrant qdrant-0 -- tar -czf /tmp/qdrant-backup-$TIMESTAMP.tar.gz /qdrant/snapshots
kubectl cp qdrant/qdrant-0:/tmp/qdrant-backup-$TIMESTAMP.tar.gz ./qdrant-backup-$TIMESTAMP.tar.gz