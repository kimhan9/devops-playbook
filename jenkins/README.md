# Deploy Jenkins
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install my-jenkins jenkinsci/jenkins -n jenkins \
  --create-namespace \
  --set controller.tag="lts-jdk21" \
  --set controller.serviceType=NodePort \
  --set controller.nodePort=30080

# Jenkins install plugins
Docker
Docker Commons
Docker Pipeline
Docker API
docker-build-step

# Deploy SonarQube
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
helm install my-sonar sonarqube/sonarqube -n sonarqube \
  --create-namespace \
  --set community.enabled=true \
  --set community.buildNumber="26.9.0.129388" \
  --set monitoringPasscode="hello123!"
