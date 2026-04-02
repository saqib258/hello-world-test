# Replace the top line with this:
FROM amazoncorretto:17-al2-jdk

WORKDIR /app
COPY target/classes /app
CMD ["java", "com.example.Hello"]
