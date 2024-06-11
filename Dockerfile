# If the target folder exists at local, 
# No need to build tha Java app with "mvn clean package" for the image  
FROM openjdk:21

COPY target/crud-api-0.0.1-SNAPSHOT.jar app-1.0.0.jar

ENTRYPOINT [ "java", "-jar", "app-1.0.0.jar" ]
