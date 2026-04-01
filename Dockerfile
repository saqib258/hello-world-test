# Use an OpenJDK Runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the compiled class files from the target directory
COPY target/classes/com /app/com

# Run the application
CMD ["java", "com.example.Hello"]
