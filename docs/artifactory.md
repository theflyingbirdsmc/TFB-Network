### How to redeploy JFrog Artifactory

I found some commands from this site (https://artifacthub.io/packages/helm/jfrog/artifactory-oss),
which helped me setup some steps to redeploy Artifactory if its broken. Its easier to reinstall than to fix it haha.

## Install and update repository
- helm repo add jfrog https://charts.jfrog.io/
- helm install -name artifactory jfrog/artifactory-oss
- helm repo update

## Create Artifactory in the tfb-backend namespace
- helm upgrade --install artifactory-oss --set artifactory.postgresql.postgresqlPassword=AYyTYWb9a5 --namespace tfb-backend jfrog/artifactory-oss

## Update Artifactory with proxy
helm upgrade --install artifactory-oss --set artifactory.nginx.enabled=false --set artifactory.ingress.enabled=true --set artifactory.ingress.hosts[0]="jfrog.rosenvold.tech" --set artifactory.artifactory.service.type=NodePort --namespace tfb-backend jfrog/artifactory-oss

## Apply changes from Improved-Infrastructure
- kubectl apply -f .\kubernetes\backend\jfrog\