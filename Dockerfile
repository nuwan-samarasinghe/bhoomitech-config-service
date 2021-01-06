# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Make port 8080 available to the world outside this container
EXPOSE 8181

# The application's jar file
COPY "/target/config-service-0.0.1-SNAPSHOT.jar" "/usr/app/"

WORKDIR "/usr/app"

# Add the application's jar to the container
ADD ${JAR_FILE} config-service.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","config-service-0.0.1-SNAPSHOT.jar"]
