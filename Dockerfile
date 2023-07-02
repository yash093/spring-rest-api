FROM openjdk:11-jdk
WORKDIR /app
COPY target/spring-api-exe.jar /app.jar

ENTRYPOINT ["java"]
CMD ["-jar", "/app.jar"]
