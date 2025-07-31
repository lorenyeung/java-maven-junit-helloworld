ARG tag
FROM us-docker.pkg.dev/image-repo/maven:3.6.3-jdk-8 AS build-stage
RUN whoami

FROM scratch AS export-stage
WORKDIR /java-maven-junit-helloworld/
COPY --from=build-stage /java-maven-junit-helloworld/target/surefire-reports/ .
