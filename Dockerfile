ARG tag
FROM us-central1-docker.pkg.dev/sales-209522/loren-test/maven:3.6.3-jdk-8 AS build-stage
RUN whoami
COPY harness/target /harness/target/
RUN ls -R /harness/target || true

FROM scratch AS export-stage
WORKDIR /harness
COPY --from=build-stage /harness/target/surefire-reports/ .
