FROM jenkins/jenkins:lts-jdk21

USER root
COPY --from=docker:27-cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker:27-cli /usr/local/libexec/docker/cli-plugins /usr/local/libexec/docker/cli-plugins
COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/trivy
COPY --from=aquasec/trivy:latest /contrib /contrib
COPY --from=node:22-trixie-slim /usr/local/bin/node /usr/local/bin/node

RUN jenkins-plugin-cli --plugins \
    workflow-aggregator \
    git \
    credentials-binding \
    sonar \
    htmlpublisher \
    pipeline-stage-view \
    timestamper
