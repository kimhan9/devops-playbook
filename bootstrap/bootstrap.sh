aws eks update-kubeconfig --region ap-southeast-1 --name horus

# Deploy argocd
helm upgrade --install argocd argo/argo-cd \
  -n argocd --create-namespace \
  --version 10.9.6 -f values.yaml

helm upgrade argocd argo/argo-cd -n argocd --version 10.9.6 \
  --reset-then-reuse-values \
  -f values2.yaml

# Generate mysql password for wordpress
kubectl create secret generic mysql-pass \
  --from-literal=password='helloPassword!' -n wordpress
