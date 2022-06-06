#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ADD target/devOpsDemo-0.0.1-SNAPSHOT.jar app.jar

#ENTRYPOINT ["java","-jar","app.jar"]

#EXPOSE 2222
FROM openjdk:8-jdk-alpine
RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
COPY target/devOpsDemo-0.0.1-SNAPSHOT.jar /app.jar
CMD ["java","-jar","/app.jar"]
EXPOSE 2222
