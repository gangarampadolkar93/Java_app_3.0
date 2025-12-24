FROM adoptium/temurin11:latest
WORKDIR /app
COPY ./target/*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]
