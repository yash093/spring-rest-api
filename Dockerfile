FROM openjdk:11-jdk
COPY target/spring-api-exe.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
