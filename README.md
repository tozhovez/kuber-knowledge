# kuber-knowledge
Kubernetes
kubectl create namespace argocd

kubectl -n argocd create secret tls kube-ca-secret \
--cert=/home/sopka/work/kuber-knowledge/certficates/ca.crt \
--key=/home/sopka/work/kuber-knowledge/certficates/ca.key

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
argocd admin initial-password -n argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml

https://raw.githubusercontent.com/argoproj/argo-cd/v2.12.2/manifests/install.yaml
curl -o install.yaml https://raw.githubusercontent.com/argoproj/argo-cd/v2.12.2/manifests/install.yaml

kubectl -n argocd apply -f ./argo-cd/argo_1.yaml