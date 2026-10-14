# Trivy

## Trivy config
- What it does: Scans IAC files and configuration templates for security misconfigurations and compliance issues.
- Primary Target: Individual configuration files or directories containing Dockerfiles, Terraform scripts, Kubernetes manifests, CloudFormation, and Helm charts.
```
docker run --rm \
  -v "$PWD":/app \
  aquasec/trivy config \
  --severity HIGH,CRITICAL \
  --format table \
  .
```

## Trivy fs
- What it does: Scans a local directory or project filesystem for package vulnerabilities, hardcoded secrets, and optionally misconfigurations.
- Primary Target: Source code directories, repositories, and dependency lock files (such as package-lock.json, Gemfile.lock, requirements.txt).
```
docker run --rm \
  -v "$PWD":/app \
  aquasec/trivy fs --scanners vuln,misconfig,secret \
  --severity HIGH,CRITICAL \
  --format table \
  .
```
