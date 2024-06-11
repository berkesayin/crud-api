# Multi-stage Dockerfile to build the application image

# Stage 1: Build the application (build environment)
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /crud-app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests 

# Stage 2: Run the application (runtime environment)
FROM openjdk:21
EXPOSE 8080
COPY --from=build /crud-app/target/crud-api-0.0.1-SNAPSHOT.jar app-1.0.0.jar
ENTRYPOINT ["java", "-jar", "/app-1.0.0.jar"]