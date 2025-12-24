FROM eclipse-temurin:11-jdk-alpine-3.23
WORKDIR /app
COPY ./target/*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]
