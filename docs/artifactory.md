### How to redeploy JFrog Artifactory

I found some commands from this site (https://artifacthub.io/packages/helm/jfrog/artifactory-oss),
which helped me setup some steps to redeploy Artifactory if its broken. Its easier to reinstall than to fix it haha.

## Install and update repository
- helm repo add jfrog https://charts.jfrog.io/
- helm install -name artifactory jfrog/artifactory-oss
- helm repo update

## Create Artifactory in its own namespace
``` bash
helm upgrade --install artifactory-oss --set artifactory.postgresql.postgresqlPassword=artifactory --set artifactory.nginx.enabled=false --set artifactory.ingress.enabled=true --set artifactory.ingress.hosts[0]="jfrog.theflyingbirds.net" --set artifactory.artifactory.service.type=ClusterIP --namespace artifactory-oss jfrog/artifactory-oss
``` 
## Apply changes from Improved-Infrastructure
- kubectl apply -f .\kubernetes\backend\jfrog\
