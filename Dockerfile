############## conventional way of creating Dockerfile ###############
#
# the disadvantage is that not much secire and consumes more space, as well as prone to attaks not much secure 
#

#FROM openjdk:11-jdk
#WORKDIR /app
#COPY target/spring-api-exe.jar /app.jar

#ENTRYPOINT ["java"]
#CMD ["-jar", "/app.jar"]

#####################################################################


##### Multistage build docker build and distroless image concept ####
FROM maven:3.8.4-openjdk-11-slim AS builder
WORKDIR /build
COPY . .
RUN mvn clean install -DskipTests

FROM gcr.io/distroless/java-debian11
WORKDIR /app
COPY --from=builder /build/target/spring-api-exe.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

####################################################################
