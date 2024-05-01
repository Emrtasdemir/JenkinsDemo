FROM openjdk:21
ARG JAR_FILE=target/*.jar
COPY demo-0.0.1-SNAPSHOT.jar application.jar
ENTRYPOINT ["java", "-jar", "application.jar"]
