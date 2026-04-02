FROM amazoncorretto:17-al2-jdk

WORKDIR /app

# Copy the JAR file from the target folder
COPY target/*.jar app.jar

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
