aws eks update-kubeconfig --region ap-southeast-1 --name horus

# Deploy argocd
helm upgrade --install argocd argo/argo-cd \
  --namespace argocd \
  --create-namespace \
  --version 10.9.6 \
  --values values.yaml

# Generate mysql password for wordpress
kubectl create secret generic mysql-pass \
  --from-literal=password='helloPassword!' -n wordpress
